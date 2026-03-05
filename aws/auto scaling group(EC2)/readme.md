# step-by-step procedure to create an Auto Scaling Group without a Load Balancer in Amazon Web Services using Amazon EC2 Auto Scaling.

## Step 1: Login to AWS Console

- Go to Amazon Web Services console.

- Login to your account.

- Search for Amazon EC2 in the services search bar.

## Step 2: Create a Launch Template

A Launch Template defines how new EC2 instances should be created.

In the EC2 dashboard → click Launch Templates (left menu).

Click Create Launch Template.

Fill the following details:

- Example configuration:

- Template name: my-template

- AMI: Amazon Linux 2

- Instance type: t2.micro

- Key pair: select your key pair

- Security group: allow SSH (22)

Scroll down and click Create Launch Template.

Now the template is ready to launch instances automatically.

## Step 3: Create Auto Scaling Group

In the EC2 dashboard → click Auto Scaling Groups.

Click Create Auto Scaling Group.

Enter:

Example:

Auto Scaling group name: my-scaling-group

Select the Launch Template you created.

Click Next.

## Step 4: Choose Network

Select your VPC.

Select Subnets (choose at least one or two).

Example:

VPC: default
Subnets: subnet-1, subnet-2

Click Next.

## Step 5: Skip Load Balancer

AWS will ask for a load balancer.

Select:

No load balancer

Click Next.

## Step 6: Configure Group Size

Set how many instances should run.

Example configuration:

Minimum capacity: 1
Desired capacity: 2
Maximum capacity: 4

Meaning:

Always keep 1 instance

Normally run 2 instances

Can scale up to 4 instances

Click Next.

## Step 7: Add Scaling Policy

Choose Target Tracking Scaling Policy.

Example:

Metric:

Average CPU Utilization

Target value:

50%

Meaning:

If CPU goes above 50% → add instance

If CPU goes below 50% → remove instance

Metrics come from Amazon CloudWatch.

Click Next.

## Step 8: Configure Notifications (Optional)

You can configure notifications using Amazon Simple Notification Service if you want alerts when scaling happens.

Click Next.

## Step 9: Review and Create

Review all settings.

Click Create Auto Scaling Group.

## Step 10: Verify Instances

Go to EC2 → Instances.

You will see instances automatically launched by the Auto Scaling Group.

Example:

Instance 1 → running
Instance 2 → running

If load increases, AWS automatically launches more instances.

## Example Architecture (Without Load Balancer)
Auto Scaling Group
   |     |     |
 EC2   EC2   EC2

Instances run independently.

## What Auto Scaling Will Do Automatically

1. Launch new EC2 instances

2. Terminate extra instances

3. Replace unhealthy instances

4. Maintain minimum number of servers

## IMPORTANT-
### Instance Warmup Setting

Warmup time tells Auto Scaling how long to wait before evaluating metrics.

Example:

Instance warmup: 300 seconds

After this time, scaling rules apply.

If metrics say scaling is not needed → instance may be terminated.
