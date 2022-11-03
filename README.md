# DynamicGaugeTargets

This repo is built to try out creating an object for storing targets for dashboard Dynamic Gauge components. There will be a flow that can read DashboardTarget records and the SOQL on them and then use that SOQL to update the record.

There is a dependency on UnofficialSF's flow component for using SQOL (https://unofficialsf.com/a-graphical-soql-query-builder-for-flow/) which gets automatically installed.

Has a mapping and sample dataset that will insert to some of the standard objects. The dev.json includes the setting for turning off persistent browser caching (enableS1EncryptedStoragePref2).

## Development

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.
