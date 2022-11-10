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

## Use
If you want to use this project in real life I **strongly** recommend you deploy it to a sandbox first, test, and then deploy from the sandbox to production. Steps to deploy to a sandbox:
1. Connect your sandbox to SFDX
    a. sfdx force:auth:web:login --setalias __name of sandbox__ --instanceurl https://test.salesforce.com  
    (once taken to test.salesforce.com you can click to use a custom domain)  
2. Delete from your local copy of the project all the parts of it that you do not want to deploy (and are going to cause you errors in deployment.) This means:
    a. the dashboards (because the running user won't exist),
    b. the reports (irrelevant)
    c. the applications (I assume you don't want or need to modify the standard Sales app in your sandbox)
    d. the list views for Account and Contact (you shouldn't need them)
    e. and the profiles (you won't be able to deploy them without heavy editing)
3. Deploy the metadata
    a. sfdx force:source:deploy -u __name of sandbox__ -p 'force-app'
4. Once deployed you will need to modify field level security for all of the deployed fields or nobody will be able to see them--even you!