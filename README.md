# Big Data Pipeline: USD/RUB Exchange Rate Analysis

## Project Overview
End-to-end data pipeline for collecting, streaming, storing, and analyzing exchange rate data.

## Architecture
CSV Dataset → Kafka Producer → Kafka Topic → Kafka Consumer → HDFS → Dashboard
↓
Real-time Producer
## Technologies
- Python 3.6
- Apache Kafka (Message Broker)
- Hadoop HDFS (Distributed Storage)
- Pandas/Matplotlib (Analytics & Visualization)

## Results
- **Total records processed:** 134 (test data for Jan-Feb 2001)
- **Mean exchange rate:** 28.59 RUB/USD
- **Min rate:** 28.16 RUB/USD
- **Max rate:** 28.96 RUB/USD
## Files Structure
├── data/dataset.csv # Source data
├── kafka/ # Producer and Consumer
├── hadoop/ # MapReduce analysis
├── visualization/ # Dashboard generator
└── results/ # Output PNG and TXT files
## How to Run
1. Start Kafka: `/usr/local/kafka/bin/kafka-server-start.sh`
2. Run consumer: `python kafka/consumer_hdfs_fixed_v2.py`
3. Run producer: `python kafka/batch_producer_fixed.py`
4. Generate dashboard: `python visualization/dashboard_simple.py`
