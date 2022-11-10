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
4. As of this writing (11/10/2022) the filter logic for the entry conditions for flow DashboardTarget_BeforeSave_Update_SOQL_Query does not save. It should be OR logic. You will have to manually update this as of now.

## Use

If you want to use this project in real life I **strongly** recommend you deploy it to a sandbox first, test, and then deploy from the sandbox to production. Steps to deploy to a sandbox:

1. Connect your sandbox to SFDX
    1. a. sfdx force:auth:web:login --setalias __aliasforsandbox__ --instanceurl https://test.salesforce.com 
    2. (once taken to test.salesforce.com you can click to use a custom domain)
2. Make sure that you [install the UnofficialSF flow component](https://unofficialsf.com/a-graphical-soql-query-builder-for-flow/) in your sandbox, since it's required for one of this project's flows. 
3. Delete from your local copy of the project's force-app folder all the parts of it that you do not want to deploy (and are going to cause you errors if you try.) This means:
    1. Folder: dashboards (because the running user won't exist)
    2. Folder: reports (irrelevant)
    3. Folder: applications (I assume you don't want or need to modify the standard Sales app in your sandbox)
    4. Folders for Account and Contact within the objects folder. (All that's there are list views and you shouldn't need them.)
    5. folder: profiles (you woudln't be able to deploy the admin profile without heavy editing)
4. Deploy the metadata:
    1. sfdx force:source:deploy -u __aliasforsandbox__ -p 'force-app'
5. Once deployed you will need to modify field level security for all of the deployed fields (or nobody will be able to see them--even you!)
6. Don't forget to modify and/or activate the flows that are installed.
7. As of this writing (11/10/2022) the filter logic for the entry conditions for flow DashboardTarget_BeforeSave_Update_SOQL_Query does not save. It should be OR logic. You will have to manually update this as of now.
