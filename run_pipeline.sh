#!/bin/bash
echo "🚀 Starting Big Data Pipeline..."

# Запуск Kafka (если не запущен)
echo "1. Starting Kafka..."
/usr/local/kafka/bin/zookeeper-server-start.sh -daemon /usr/local/kafka/config/zookeeper.properties
sleep 5
/usr/local/kafka/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/server.properties
sleep 10
# Создание топика
/usr/local/kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --topic raw-data --partitions 1 --replication-factor 1 2>/dev/null

echo "2. Starting Consumer..."
python3 kafka/consumer_hdfs_fixed.py &
CONSUMER_PID=$!
sleep 2
echo "3. Sending data via Producer..."
python3 kafka/batch_producer_fixed.py

echo "4. Generating Dashboard..."
python3 visualization/dashboard_working.py

echo "5. Pipeline completed!"
echo "Results saved in: ~/Desktop/bigdata_project/"
echo "  - dashboard.png"
echo "  - report_*.txt"
# Остановка consumer
kill $CONSUMER_PID 2>/dev/null

echo "✅ Done!"
