# Blockchain Tracker

This repository implements a blockchain-based tracking system for monitoring the location and status of high-value goods during transportation. By leveraging blockchain technology, the system aims to provide transparency, security, and immutability to the tracking process, thereby reducing the risks associated with tampering, counterfeiting, and theft.

## Problem Statement

In today's supply chain systems, the need for improved tracking and logging of high-value goods has become increasingly crucial. During transportation, these goods are susceptible to tampering, counterfeiting, and robbery, posing significant challenges for logistics and security. To address these issues, the project proposes the use of blockchain technology to create immutable records of every transaction, exchange, and live location of the products.

## Solution

The proposed solution employs a GPS-enabled asset tracking system integrated with blockchain technology. Each high-value item is equipped with an NFC chip that communicates with a GPS device attached to the delivery vehicle or storage location. The GPS device sends data about each product's location and status to the blockchain platform, ensuring secure and transparent tracking throughout the supply chain.

## Key Functions Implemented

1. **generate_New_Parcel_ID()**: Assigns a unique ID to every package to facilitate tracking and logging.

2. **parcel_departed()**: Updates the blockchain with information indicating that the package has left a particular endpoint.

3. **change_Location()**: Allows authorized users to manually update the location of the package on the blockchain and send alerts about location changes.

4. **parcel_hand_over()**: Tracks the handover of parcels between entities and updates the blockchain with relevant information, ensuring reliable and verifiable exchanges.

5. **update_StatusAsDelivered()**: Updates the status of the parcel once it has been delivered to the endpoint, triggering notifications to users.

6. **addState()**: Updates the status of the package in transit from start to endpoint, providing a comprehensive view of its journey.

7. **searchProduct()**: Retrieves detailed information about a product and its transit location based on user demand.

8. **set_hash_for_parcel()**: Implements an anti-counterfeit solution by generating a QR code with a hash stored on the blockchain. Any tampering or counterfeiting attempts will trigger alerts due to changes in the QR code hash.


## Future Enhancements

1. Integration with IoT devices for real-time monitoring of environmental conditions such as temperature, humidity, and shock during transit.
2. Implementation of smart contracts to automate and secure transactions between parties involved in the supply chain.
3. Integration with data analytics tools to gain insights into supply chain performance and identify areas for optimization.
