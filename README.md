# blockchain_tracker


Blockchain technology offers some benefits over Traditional Centralized GPS. It provides higher levels of transparency, is less likely to be hacked, and enables faster data processing.  we log the data provided throught gps asset tracking system on blockchain. The data is transmitted via AES- 256 encryption standard.
Geo-tags can be used to determine the tracking and logging of transportation of high-value materials like minerals, parcels, luggage, containers, fuels, money transported from bank to bank, etc. 



Understanding problem

Improving the tracking and logging of the location of high-value goods has become a vital concern in today's supply-chain systems. during the transportation of high value goods there is often a chance of tampering, counterfeiting or robbery. In order to tackle these issue we propose the use of block chain technology to create immutable records of every transaction, exchange and live location of the product.

Thus to secure and recover these assets, we employ  blockchain. We use Communication in a GPS-enabled asset tracking system : a GPS device that can communicate with NFC. 
We  attach a high-grade GPS tracker to a  delivery vehicle or the location or the piece is stored. Products inside are equipped with an NFC chip each that communicates with the GPS. The GPS sends data about each product from their NFC chips to the blockchain platform.



Problem functions implemented:

generate_New_Parcel_ID() : 
 as our application requires us to assign a unique id to every package we generate new parcel id.

parcel_departed ():  
This function will update the blockchain with information that the package has left a particular end point.

change_Location (): 
If we want to update the location, we use this function. This can be used by authorized users to manually update the location of the package on blockchain as well as send an alert to the user about the goods change of location.

parcel_hand_over(): 
Reliable and verifiable hand-over of parcel is an integral part of the security of the parcel. The handover parcel keeps track of the previous location and delivery ( inward ) of the parcel and then update the blockchain when the parcel changes entities and completes an exchange at a warehouse or delivery agent etc. so we can keep track of who all handled the package.

update_StatusAsDelivered ():
it is necessary to update the status of the parcel once its delivered to the end point so a notification can be sent to user for succesful verification of delivery.

addState() : 
It will update the status of the package  in the transit process from start to end point. 
Example : from manufacturer to distributor to retailer and finally consumer.

searchProduct(): 
It will provide the detail of Product and transit  location of co-ordinates as per the user demand.

set_hash_for_parcel ():
As we mentioned about anti-counterfeit solution. a QR code will be generated by the owner for the package whose hash will be stored on the blockchain. The QR code will provide information of the package. Any attempt of tampering of package or counterfeiting of package will change the hash of QR code and will Alert the user.


