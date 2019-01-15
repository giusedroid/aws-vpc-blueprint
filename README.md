# aws-vpc-blueprint

Need a VPC in AWS? There you go.  

## Description

This template deploys a VPC, with 2 public, 2 private and 2 data (private) subnets spread across two Availability Zones.  
It deploys an Internet Gateway, with a default route on the public subnets.  
It deploys a pair of NAT Gateways (one in each AZ),
and default routes for them in the private and data subnets.

## Local Usage

Configure your local AWS environment then just

```bash
make local
```

## CI Usage

This template is deployed via CircleCI. Do you want a different CI tool? Happy to accept PRs.

## Exports

This template exports the following

| Export Name                       | Value                                                     |
|--------------------------------   |-------------------------------------------------------    |
| ${Environment}-vpc                | VPC Id                                                    |
| ${Environment}-public-subnets     | Comma (,) separated list of public subnet ids             |
| ${Environment}-private-subnets    | Comma (,) separated list of private subnet ids            |
| ${Environment}-data-subnets       | Comma (,) separated list of data (private) subnet ids     |
