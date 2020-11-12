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


# target-pools

A target pool allows a single access point to all the instances in a group and is necessary for load balancing.

```bash
gcloud compute target-pools create nginx-pool
```

# instance-template

```bash
gcloud compute instance-templates create nginx-template \
         --metadata-from-file startup-script=startup.sh
```