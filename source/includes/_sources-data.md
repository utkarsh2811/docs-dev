# Sources Data

Source data endpoint allows sending multiple data items to multiple collections in the same http request.

Propeties in request object are names of the collection to save data to, and values are lists of data items with properties corresponding to collection schema.

```shell
curl "https://api.intempt.com/v1/your-org/sources/source-id/data"
  -d 
  '{
	"page":[{
		"visitorId": "93b82f97-809e-40ac-4f98-33423c4d0de6",
		"eventId": "94f9af87-4798-421d-b045-2b23418cd31b",
		"serverTimestamp": 1583241373335,
		"timestamp": 1583241372975,
		"parentTimestamp": 1583241176530,
		"title": "Hamlet Pant â Intempt1",
		"pageUrl": {
			"scheme": "https",
			"userInfo": null,
			"host": "demo.intempt.com",
			"port": null,
			"path": "/collections/pants/products/hamlet-pant",
			"query": null,
			"fragment": null
		}
	}],
	"interaction":[{
		"visitorId": "93b82f97-809e-40ac-4f98-33423c4d0de6",
		"eventId": "a475ad7b-3a55-497f-891f-bffc08dc7417",
		"serverTimestamp": 1583241261990,
		"timestamp": 1583241261532,
		"parentTimestamp": 1583241197506,
		"type": "click",
		"element": {
			"tag": "a",
			"name": null,
			"href": "/collections/pants/products/hamlet-pant",
			"className": "grid-view-item__link grid-view-item__image-container",
			"classList": [],
			"id": "",
			"path": "div:nth-child(4) > main > div > div > div > div > div:nth-child(4) > div > a",
			"text": "Hamlet Pant\nRegular price\n$208.60",
			"value": null,
			"number": 208.6,
			"checked": null,
				"attributes": {}
			}
	},{
		"visitorId": "93b82f97-809e-40ac-4f98-33423c4d0de6",
		"eventId": "af9f579a-796d-4e49-b1f5-33be7db5423e",
		"serverTimestamp": 1583241179982,
		"timestamp": 1583241178977,
		"parentTimestamp": 1583241178647,
		"type": "click",
		"element": {
			"tag": "div",
			"name": null,
			"href": null,
			"className": "page-width",
			"classList": [],
			"id": "",
			"path": "div:nth-child(4) > main > div:nth-child(2) > div",
			"text": "COLLECTION LIST\nDress\nAccessories\nPants",
			"value": null,
			"number": null,
			"checked": null,
			"attributes": {}
		}
	}]
  }'
  -X POST
  -H "Authorization: ApiKey <YOUR_API_KEY>"
```

> Example response:

```json
{
    "_embedded": {
        "data": [
            {
                "collId": 63065212245184512,
                "id": 68117041425346560,
                "updated": 1583250384494,
                "data": {
                    "visitorId": "93b82f97-809e-40ac-4f98-33423c4d0de6",
                    "eventId": "94f9af87-4798-421d-b045-2b23418cd31b",
                    "serverTimestamp": 1583241373335,
                    "timestamp": 1583241372975,
                    "parentTimestamp": 1583241176530,
                    "title": "Hamlet Pant â Intempt1",
                    "pageUrl": {
                        "scheme": "https",
                        "userInfo": null,
                        "host": "demo.intempt.com",
                        "port": null,
                        "path": "/collections/pants/products/hamlet-pant",
                        "query": null,
                        "fragment": null
                    }
                },
                "_links": {
                    "collection": {
                        "href": "http://localhost:8081/v1/demo-intempt-com/collections/63065212245184512"
                    },
                    "self": {
                        "href": "http://localhost:8081/v1/demo-intempt-com/collections/63065212245184512/data/68117041425346560"
                    }
                }
            },
            {
                "collId": 63065212245184514,
                "id": 68116568966369280,
                "updated": 1583250384494,
                "data": {
                    "visitorId": "93b82f97-809e-40ac-4f98-33423c4d0de6",
                    "eventId": "a475ad7b-3a55-497f-891f-bffc08dc7417",
                    "serverTimestamp": 1583241261990,
                    "timestamp": 1583241261532,
                    "parentTimestamp": 1583241197506,
                    "type": "click",
                    "element": {
                        "tag": "a",
                        "name": null,
                        "href": "/collections/pants/products/hamlet-pant",
                        "className": "grid-view-item__link grid-view-item__image-container",
                        "classList": [],
                        "id": "",
                        "path": "div:nth-child(4) > main > div > div > div > div > div:nth-child(4) > div > a",
                        "text": "Hamlet Pant\nRegular price\n$208.60",
                        "value": null,
                        "number": 208.6,
                        "checked": null,
                        "attributes": {}
                    }
                },
                "_links": {
                    "collection": {
                        "href": "http://localhost:8081/v1/demo-intempt-com/collections/63065212245184514"
                    },
                    "self": {
                        "href": "http://localhost:8081/v1/demo-intempt-com/collections/63065212245184514/data/68116568966369280"
                    }
                }
            },
            {
                "collId": 63065212245184514,
                "id": 68116225201205248,
                "updated": 1583250384494,
                "data": {
                    "visitorId": "93b82f97-809e-40ac-4f98-33423c4d0de6",
                    "eventId": "af9f579a-796d-4e49-b1f5-33be7db5423e",
                    "serverTimestamp": 1583241179982,
                    "timestamp": 1583241178977,
                    "parentTimestamp": 1583241178647,
                    "type": "click",
                    "element": {
                        "tag": "div",
                        "name": null,
                        "href": null,
                        "className": "page-width",
                        "classList": [],
                        "id": "",
                        "path": "div:nth-child(4) > main > div:nth-child(2) > div",
                        "text": "COLLECTION LIST\nDress\nAccessories\nPants",
                        "value": null,
                        "number": null,
                        "checked": null,
                        "attributes": {}
                    }
                },
                "_links": {
                    "collection": {
                        "href": "http://localhost:8081/v1/demo-intempt-com/collections/63065212245184514"
                    },
                    "self": {
                        "href": "http://localhost:8081/v1/demo-intempt-com/collections/63065212245184514/data/68116225201205248"
                    }
                }
            }
        ]
    },
    "_links": {
        "self": {
            "href": "http://localhost:8081/v1/demo-intempt-com/sources/63065209300783104/data"
        }
    }
}
```
