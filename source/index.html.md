---
title: Intempt API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  # - <a href='#'>Sign Up for a Developer Key</a>

includes:
  - sources
  - sources-data
  - collections
  - collection-data
  - errors
  - main-concepts
  - jst-use-case

search: true
---

# Introduction

```shell
curl "https://api.intempt.com"
```

> Example response:

```json
{
  "service": "crel",
  "version": "v1",
  "status": "ok",
  "_links": {
    "sources": {
      "href": "https://api.intempt.com/v1/your-org/sources/"
    }
  }
}
```

Intempt API allows developers to integrate Ecommerce platforms, CRMs and POS machines with Intempt real time segmentation platform.

Base URL: `https://api.intempt.com/`

Sending request to the root URL will return API details.

### HTTP Request

`GET https://api.intempt.com`

<aside class="success">Most calls return <code>'_links'</code> object containing URLs to related entities</aside>

<aside class="notice">Prerequisite: Intempt platform uses Apache Avro Schema, which you can get familiar with <a href="https://avro.apache.org/docs/current/spec.html">here</a></aside>



# Authentication

Intempt uses api keys to authorize API access. To get hold of an api key, you will first need to login to Intempt Console.

[Login here](https://app.intempt.com/login).

Or [create a new account here](https://app.intempt.com).

Navigate to the edit view of an existing Source or create a new one.

The api key will be located in the Source configuration object in the code box at the bottom.

Intempt expects the api key to be included in all API requests in a header that looks like the following:

`Authorization: ApiKey <YOUR_API_KEY>`


