# DynamicGaugeTargets

This repo demonstrates creating an object for storing targets for dashboard Dynamic Gauge components. There is a flow that can read DashboardTarget records for the Contact object and the SOQL on them and then use that SOQL to update the record. There is another flow that can be modified to run as a daily scheduled flow that calls the flow for contact dashboardtargets. To use with targets about other objects simply replicate the DashboardTargets_Contact targets flow to get records of another object and then add calling that as a subflow within DashboardTargets_Run object updates.

There is a dependency on UnofficialSF's flow component for using SQOL (https://unofficialsf.com/a-graphical-soql-query-builder-for-flow/) which gets automatically installed in scratch orgs.

Repo also has a mapping and sample dataset that will insert accounts, contacts, and dashboardtargets. All but one of those dashboardtargets have no value in Target but will be filled if you run the flow.

The dev.json includes the setting for turning off persistent browser caching (enableS1EncryptedStoragePref2).

## Development

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.
