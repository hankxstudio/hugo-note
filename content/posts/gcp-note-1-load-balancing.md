+++
title = "Gcp Note 1 Load Balancing"
date = "2020-11-12T09:33:31+08:00"
author = ""
authorTwitter = "" #do not include @
cover = ""
tags = ["", ""]
keywords = ["", ""]
description = ""
showFullContent = false
+++


## target-pools

A target pool allows a single access point to all the instances in a group and is necessary for load balancing.

```bash
gcloud compute target-pools create nginx-pool
```

## instance-template

```bash
gcloud compute instance-templates create nginx-template \
         --metadata-from-file startup-script=startup.sh
```

## create instance with template

```bash
gl compute instance-groups managed create nginx-group --base-instance-name nginx --size 2 --template nginx-template --target-pool nginx-pool
```

## open socket on firewall

```bash
gl compute firewall-rules create www-firewall --allow tcp:80
```

## create loading banlancer

```bash
gcloud compute forwarding-rules create nginx-lb \
         --region us-central1 \
         --ports=80 \
         --target-pool nginx-pool
```