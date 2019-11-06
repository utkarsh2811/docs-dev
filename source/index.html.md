---
title: Intempt API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  # - <a href='#'>Sign Up for a Developer Key</a>

includes:
  - applications
  - collections
  - collection-data
  - errors

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
    "applications": {
      "href": "https://api.intempt.com/v1/your-org/applications/"
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


# Authentication

Intempt uses access tokens to authorize API access. To get hold of a token, you will first need to login to Intempt Console.

[Login here](https://app.intempt.com/).

Or [create a new account here](https://app.intempt.com/signup).

Navigate to the edit view of an existing Application or create a new one.

The token will be located in the Application configuration object in the code box at the bottom.

Intempt expects the access token to be included in all API requests in a header that looks like the following:

`Authorization: Bearer <YOUR_ACCESS_TOKEN>`


