#step-by-step procedure to use an Auto Scaling Group with a Load Balancer in AWS
##Step 1: Create a Launch Template

The launch template defines how new EC2 instances should be created.

Go to EC2 Dashboard

Click Launch Templates

Click Create launch template

Example configuration:

Template name: web-template
AMI: Amazon Linux
Instance type: t2.micro
Key pair: your-key
Security group: allow HTTP (80) and SSH (22)

Scroll down → Create Launch Template.

Step 2: Create Target Group

The target group tells the load balancer which instances will receive traffic.

In EC2 dashboard → Target Groups

Click Create Target Group

Configuration:

Target type: Instances
Protocol: HTTP
Port: 80
VPC: default

Click Create Target Group.

Step 3: Create Load Balancer

Now create the load balancer.

Go to Load Balancers in EC2 dashboard

Click Create Load Balancer

Choose:

👉 Application Load Balancer

Configuration example:

Name: my-alb
Scheme: Internet-facing
IP type: IPv4

Select:

VPC: default
Subnets: choose at least 2

Security group:

Allow HTTP (80)

Listener:

HTTP : 80 → Forward to Target Group

Click Create Load Balancer.

Step 4: Create Auto Scaling Group

Now create the scaling group.

Go to Auto Scaling Groups

Click Create Auto Scaling Group

Configuration:

Name: web-asg
Launch template: web-template

Click Next.

Step 5: Select Network

Choose network settings.

Example:

VPC: default
Subnets: subnet1, subnet2

This ensures high availability across zones.

Step 6: Attach Load Balancer

Select:

Attach to existing load balancer

Choose:

Application Load Balancer
Target Group: created earlier

Click Next.

Step 7: Configure Group Size

Define the number of instances.

Example:

Minimum capacity: 2
Desired capacity: 2
Maximum capacity: 5

Meaning:

Always keep 2 servers running

Scale up to 5 when traffic increases

Step 8: Configure Scaling Policy

Choose Target Tracking Policy.

Example:

Metric: Average CPU Utilization
Target value: 50%

Behavior:

CPU > 50% → launch new instance
CPU < 50% → terminate instance

Metrics are monitored using Amazon CloudWatch.

Step 9: Review and Create

Check all configurations and click Create Auto Scaling Group.

AWS will now automatically:

Launch EC2 instances

Attach them to the load balancer

Scale instances when traffic changes

Architecture Diagram
Users
   |
Application Load Balancer
   |
Target Group
   |
Auto Scaling Group
 |      |      |
EC2    EC2    EC2
