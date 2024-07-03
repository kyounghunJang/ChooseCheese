import time
from pyflink.common import WatermarkStrategy
from pyflink.common.serialization import SimpleStringSchema
from pyflink.datastream.connectors.kafka import KafkaSource, KafkaOffsetsInitializer
from pyflink.common import WatermarkStrategy
from pyflink.datastream import StreamExecutionEnvironment
from pyflink.datastream.stream_execution_environment import StreamExecutionEnvironment
from person_smile import Choosecheese
import save_pose
import os
import base64
import boto3

from multiprocessing import Process
broker_server=os.environ['broker_server']


def put_to_dynamodb(merge_dic):
    Dynamodb = boto3.client('dynamodb',region_name='ap-northeast-2')
    Dynamodb.put_item(TableName='Capstone', Item=merge_dic)
    print(merge_dic)

def preprocessing(datas):
    person_smile=Choosecheese()
    pose_dic,b64_data=save_pose.simulation(datas['image_bytes'])
    im_bytes = base64.b64decode(b64_data)

    person_dic=person_smile.search_and_add_users_by_image(datas['username'],im_bytes)    
    merge_dic={**pose_dic,**person_dic}
    print(merge_dic)
    p = Process(target=put_to_dynamodb, args=(merge_dic,))
    p.start()
    p.join()

class FlinkProcessing:

    def __init__(self):
        self.env=StreamExecutionEnvironment.get_execution_environment()
        self.env.add_jars("file:///mnt/data/Flink_server/Driver/aws-msk-iam-auth-2.1.0-all.jar")
        self.env.add_jars("file:///mnt/data/Flink_server/Driver/kafka-clients-3.5.1.jar")
        self.env.add_jars("file:///mnt/data/Flink_server/Driver/flink-connector-kafka-3.0.2-1.18.jar")
        
    def flink_processing(self):
        source = KafkaSource.builder() \    
            .set_bootstrap_servers(broker_server) \
            .set_topics("test") \
            .set_value_only_deserializer(SimpleStringSchema()) \
            .set_starting_offsets(KafkaOffsetsInitializer.latest()) \
            .build()
        self.env.from_source(source, WatermarkStrategy.no_watermarks(), "Kafka Source")\
            .map(preprocessing)\
            .print()
        self.env.execute()


if __name__ == "__main__":
    test= FlinkProcessing()
    test.flink_processing()



