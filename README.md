# Deploying a Data Warehouse in the Cloud with Amazon Redshift AWS!!

[![NPM](https://img.shields.io/npm/l/react)](https://github.com/pand-eX/DwNuvem/blob/main/LICENSE) 

# About the project

-Would it be possible to mount a Data Warehouse for storage and processing petabytes of data in just a few clicks? 

A: Yes! With amazon Redshift.

-You saw the job that was to set up a Data Warehouse on premises with Oracle. And look that we set up a controlled environment a small environment an environment in my Virtual Machine.

-Now we go to the cloud environment with a few clicks we will have an operational Data Warehouse with cluster safely and ready to process tetabytes of data and a cost in most cases much lower compared to cases with on premises ie not to ignore that cloud computing is the evolution of the area of Technology.



## Why?

because we know that Cloud Computing is the future of IT. 

-This project is part of my personal portfolio, so I'll be happy if you could provide me with any feedback on the project, code, structure or anything you can report that could make me a better data engineer!

Email-me: henricao_7@yahoo.com.br

Connect with me at [LinkedIn](https://www.linkedin.com/in/henrique-castro-484269203//).

## I want to leave 3 free guidebooks on kindle on Amazon Redshift AWS and also a link with SQL language documentation used in Amazon Redshift !!!

https://docs.aws.amazon.com/pt_br/redshift/latest/dg/cm_chap_SQLCommandRef.html

![1](https://github.com/pand-eX/DwNuvem/blob/main/assets/1.png)


## Attention!!!

-We will work with data warehouse operation, we will create a Squema, load some data and we will run some Query is important that you consider the paradigm shift is a very different procedure we no longer have to worry about configuration files, Infrastructure with operating system with software installation I simply click on a web page enable the Data Warehouse to define some rules and connect , I upload my data and start the query operation!!! Let's Go!

## Starting the project

In this second data warehouse deployment project, we'll work with Amazon's cloud environment and amazon redshift service. Let's implement a cluster with 3 nodes, one leader and two compute nodes. Our cluster will have only one database. We will create the FACT and DIMENSION tables and load only a few tables.
The scripts used in the project are attached and in order!!!

## Basic Concept!

![12](https://github.com/pand-eX/DwNuvem/blob/main/assets/12.png)

An Amazon Redshift cluster consists of nodes. Each cluster has one leading node and one or more compute nodes. The lead node receives queries from client applications, analyzes queries, and develops query execution plans. The main node then coordinates the parallel execution of these plans with the compute nodes and aggregates the intermediate results of those nodes. It then returns the results back to the client applications. Compute nodes execute query execution plans and 
transmit data to each other to meet these queries. Intermediate results are sent to the lead node for aggregation before they are sent back to the client applications. When you run a cluster, an option that you specify is the node type. The node type determines the CPU, RAM, storage capacity, and storage unit type of each node. Dense storage (DS) nodes are optimized for storage. Dense computing (DC) nodes are optimized for computation. You can create a cluster using dense storage (DS) or dense computing (DC) node types. Dense storage node types allow you to create very large data warehouses using hard drives (HDDs) for a very low price. Dense compute node types allow you to create very high-performance data warehouses using fast CPUs, large amounts of RAM, and solid state disks (SSDs). DS2-type nodes are optimized for large data workloads and use hard drive (HDD) based storage. Dc1 and DC2 nodes are optimized for performance-intensive workloads. Because they use solid state disk storage (SSD), the DC1 and DC2 node types provide much faster I/O compared to DS-type nodes, but provide less storage space. You run clusters that use
the types of DC2 node in a virtual private cloud (VPC). You cannot run DC2 clusters in classic EC2 mode. The type of node you choose depends heavily on three information:

• The amount of data you import into Amazon Redshift
• The complexity of the queries and operations you perform in the 
data
• The needs of downstream systems that depend on the results 
of these consultations and operations

Node types are available in different sizes. DS2 nodes are available in xlarge and 8xlarge sizes. DC2 nodes are available in large and 8xlarge sizes. The size of the node and the number of nodes determine the total storage of a cluster. Some node types allow one node (single-node) or two or more nodes (multi-node). The minimum amount for 8xlarge clusters is two nodes. In a single-node cluster, the node is shared for primary and compute functionality. In a multi-node cluster, the lead node is separate from the compute nodes. Amazon Redshift applies quotas to resources for each AWS account in each region. A quota restricts the number of resources that your account can create for certain types of resources, such as nodes or Snapshots, in a region.

## Database in Amazon Redshift Cluster

Amazon Redshift creates a database when you provision a cluster. This is the database that you use to load data and run queries on your data. You can create additional databases by running a SQL command as needed. The limit is up to 60 databases per cluster. When you provision a cluster, you specify a primary user who has access to all databases created in the cluster. This primary user is a superuser who is initially the only user with access to the database, although that user can create other superusers and users. Amazon Redshift uses parameter groups to define the behavior of all databases in a cluster, such as date presentation style and floating-point accuracy. If you do not specify a parameter group when provisioning your cluster, Amazon Redshift binds a default parameter group to the cluster.

## Data Warehouse Architecture with Amazon Redshift 

Setting up a Data Warehouse requires two major work steps:
1- Modeling
2- Infrastructure

With regard to modeling, the procedures are the same regardless of the on-premise or cloud implementation. All steps such as business problem definition, business case, specification, logical, dimensional and physical modeling follow the same patterns once we are dealing with DW design. With regard to infrastructure, the differences between on-premise and cloud implementation are large, as these are different "worlds" with different approaches and costs. The choice of one option or another depends on several factors and a professional choice requires a 360 degree evaluation. In a cloud DW implementation, the architecture involves factors beyond the cloud service being used (Amazon Redshift in our case), because we need to define levels of access and security, storage, backup, integration, ETL, data transfer costs, bandwidth for access to cloud services, etc... All of this must be taken into account so that the cost of a cloud deployment justifies its use. While there are other options, we can talk specifically about AWS, since we are using this service here in our project. In addition to Amazon Redshift, a cloud DW implementation (typically) requires the use of other AWS services, such as:

• S3 (Simple Storage Service)

• VPC (Virtual Private Cloud)

• EIP (Elastic IP)

• Cloud Watch

• IAM (Identity and Access Management)

Of these 5 services, only IAM has no cost. Although you can use a Default VPC, any customization may insate additional charges. Storage with S3 (to put files that will be uploaded to DW), EIP (to have a unique IP), and Cloud Watch (for monitoring and alarms) are not required in an Amazon Redshift implementation, but can help collaborate to make the cloud experience much more professional. The DW architecture on AWS can also be divided into two steps. First the Amazon Redshift Cluster architecture (as shown below). The number of compute nodes determines the cost of the cluster and should be evaluated carefully.


![13](https://github.com/pand-eX/DwNuvem/blob/main/assets/13.png)


Second, the amazon redshift cluster access architecture, so that users have access to the DW, as shown below:

![14](https://github.com/pand-eX/DwNuvem/blob/main/assets/14.png)

At this time, other AWS services should be considered. VPN Gateway lets you create a secure connection between your company office and your AWS environment, but it's also a cost-effective AWS service for Redshift. It is the data engineer's job to think about the best architecture for the project, aiming to reduce costs and optimize resource utilization. Although it is possible to use Redshift only for a period of time and pay for unused hours, not all services follow this same pattern (it makes no sense to write and delete data in S3 for example, ideally using its versioning features). More advanced architectures may require the use of messenger services, such as AWS SQS, which ensures application operation even in the event of a DW fall. SQS (as you might imagine) also 
has an additional cost.

## Key benefits of a Cloud Data Warehouse:

-Decentralized environment

-No infrastructure cost

-TCO (total cost of ownership) reduced

-Scalability for Petabytes of data

-Security

-Internet access from any location

-Simplified Management


## Key disadvantages of a Cloud Data Warehouse:

-Lack of flexibility

-Sensitive data is under the management of third parties (Amazon or Microsoft etc...)

-Security (Note that security is at the advantage and disadvantage I will explain in detail)

- Data integration.


In the environment on premises you configure everything you can set up an environment as needed by the company in the cloud environment you do not configure anything infrastructure you even have access to the OS (operating system) but you need to change the paradigm if you really need to change something from the OS if you need to change some parameter of the database what is already offered in the cloud is not enough? The company has to answer this in order to make its decision to take its DW to the cloud.

Sensitive data some company listed on the Stock Exchange can not due to sarbanes-oxley law (SOX) but, there are alternatives you can encrypt the data you can create a private cloud, ie only the company office the IP of that office can access the cloud environment in order to work around this problem .

Security appears here as a disadvantage because when you have a clear cloud environment that breaking into an environment is difficult because the Amazon environment is secure, but what if someone discovered the password? Ai has no hacker that solve if company has an internal leak of passwords, but the problem is not only cloud the physical can also happen ... many companies do not have the care or the standard for this kind of thing often have the post-it on the monitor with the password... 

Data integration if you're going to mount DW in the cloud later how do I integrate this my DW with the analytics applications? How am I supposed to upload the data? How will I process my ETL? All this should be considered once again need to change the paradigm not to you want to change to cloud the same process you have on premises this is a very common error the company that reproduce a cloud environment what it already does internally and locally but that is not the approach the cloud environment is different from to use the same type of process remembering that Amazon already offers an ETL service and data integration...

![2](https://github.com/pand-eX/DwNuvem/blob/main/assets/2.png)

## One of the most challenging tasks when working with AWS is pricing i'll sit 3 main reasons that leads me to this challenge.

- We have over 1000 services on AWS hardly you will use only one service is very likely that you use more than one and so you need to check the price of each of the services that will be used individually 

- Each service has pricing range differences in the case of Amazon Redshift for example we have 3 different range not only the question of price per service but the price of each of the ranges per service I will choose each of these ranges when hiring the service 

- Each AWS region has a different price for each of the price ranges in an AWS service, yes, that's 3 reasons that we really take to challenges when you put together a price structure to actually predict when you'll spend per month or a year with the AWS service is planning and the key to the issue when you do a long-term planning you end up paying less which incidentally and one of the great advantage in several AWS services

And because that's important ???

When you work with Amazon cloud environment with Aws you will be paying by Hour or paid before even using regardless of the way of hiring is my job to optimize resource utilization in case of on demand for example you have there 3, 4 hours if you can optimize your query optimize your Amazon Redshift queries you will pay less because you will use less times it is important to know the minimum on the operation of the Amazon Redshift database in order to build a DW that is as performative as possible. 
- Query Optimization(it loads itself to find out which slices within a single node it should fetch the data as it should connect with the computer nodes to fetch the data you are querying as it should fetch the blocks in each computer nodes in each slices to optimize your query and so on ie we have little to worry about it , we have a few settings good part and made by amazon engines) 
- Internal statistic and heuristics (this also has in oracle bank it basically calculates the statistics is nothing more than a set of information to create the execution plan of a query when you shoot a Query in the database a query the database the engine it searches the statistic to know in which table it will fetch the data in which segments and so on with Amazon Redshift is the same thing incidentally is an almost standard behavior in almost all relational databases. This procedure of calculating statistics and heuristics for the Query execution plan
-ACID compliance (this basically defined any database transaction a single transaction it must be atomic, i.e. only consistent I can not stop the transaction in the middle it must be isolated, i.e. I can have 2 transactions running simultaneously and Durability, that is, once the transaction has been completed it has to be written to the data bank)
- So far we have the same features as in the Relational database but we have an inherent feature that is particularly to Amazon Redshift which is >>
– Data Distribution (which is how Amazon Redshift the Engine distributes the data through a cluster)

## Distribution Styles

- You have multiple blocks of data distributed in various nodes

![3](https://github.com/pand-eX/DwNuvem/blob/main/assets/3.png)

The definition of the style who will define is me according to the DW Scheme that I am implementing in this project we will use the snow flake scheme in Oracle we use the Model Star Squema. Each schema will have a different style and behavior when returning the data

![4](https://github.com/pand-eX/DwNuvem/blob/main/assets/4.png)

- We have 3 styles they are:

![5](https://github.com/pand-eX/DwNuvem/blob/main/assets/5.png)

- Cannot change the distribution style after the table has been created you HAVE TO DO BEFORE PUTTING THE DATA 


## Column-Oriented Storage and Redshift Speed

![6](https://github.com/pand-eX/DwNuvem/blob/main/assets/6.png)

-lines is traditional so we need to change the paradigm Amazon redshift uses the column!

![7](https://github.com/pand-eX/DwNuvem/blob/main/assets/7.png)

![8](https://github.com/pand-eX/DwNuvem/blob/main/assets/8.png)

Some Redshift Bank Feature 

- CRUD(create, ready, update, delete) this and OLTP bank in a oltp data bank makes no sense to use a column-oriented database ai we use SQLservice / Oracle ...

![9](https://github.com/pand-eX/DwNuvem/blob/main/assets/9.png)


## Data compression

- Because it is a column-oriented database I have another advantage to data compression (each column of a different block table unlike row-based storage where I have each row in a block or of course I can have multiple rows in the same block but ultimately an entire row it belongs to at least one block in the column-related database I have a column belonging to a block being so when you need aggregation operation, simurization in a single column you take that column and loads into memory the amazon redshift engine loads only the column you will do the operation in memory this for sure speeds up the query time pq I do not need to load columns that is not being used in that query this is the main advantage
![10](https://github.com/pand-eX/DwNuvem/blob/main/assets/10.png)

-If we analyze only one column it is of the same type whatever flot, integer are numeric values, but always of the same data type. I'll have an entire column in a block that is data of the same type so the compression it will be much more efficient Amazon Redshift will manage to compress this data by reducing storage spaces and that of course brings significant advantage that and also when you query.

![11](https://github.com/pand-eX/DwNuvem/blob/main/assets/11.png)


## Final result

![15](https://github.com/pand-eX/DwNuvem/blob/main/assets/15.png)

- this here is the final work PowerBI just ran a direct query on Amazon Redshift in the cloud and ready from now it is the work of the final user to collect the insights create the visualizations and with that make the decisions. It's simple the process Amazon Redshift really provides a very large power eliminates much of that manual work that you have to prepare the entire Clouding Computer environment is clearly the future.
- In Amazon Redshift it is possible to get some information and show the query and response time that Powerbi took to return the data to the final user. It also has the execution plan and the performance bonuses.




