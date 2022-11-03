# DynamicGaugeTargets

This repo is built to try out creating an object for storing targets for dashboard Dynamic Gauge components. 

Has a mapping and sample dataset that will insert to some of the standard objects, even squirrely ones like CaseComment and those with polymorphic fields, like Task and FeedItem. On those, you must only use one table in the polymorphic field (so this repo uses Contact.) And the dev.json includes the setting for turning off persistent browser caching (enableS1EncryptedStoragePref2).

## Development

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.
