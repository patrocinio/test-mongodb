Test Compose MongoDB
===
This repository contains a sample Node.JS application that can use the Compose MongoDB service in BlueMix.




Downloading this sample
---
You can clone this sample by the following command: 

    git clone https://github.com/patrocinio/test-mongodb




Running this sample
---
Create a user-defined service called mongdb by running the following command:

	create-service.sh mongodb <MongoDB Connection string>
	
You can set up SSL connection, by passing "ssl=true" in the connection string, like the example below:

	./create-service.sh mongodb mongodb://myuser:<PASSWORD>@aws-us-east-1-portal.22.dblayer.com:10407,aws-us-east-1-portal.21.dblayer.com:10405/admin?ssl=true

Then run the test:

	test-mongodb.sh