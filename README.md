# DynamicGaugeTargets

This repo demonstrates creating an object (DashboardTarget) for storing target numbers for [dashboard Dynamic Gauge components](https://help.salesforce.com/s/articleView?id=sf.dashboards_lex_chart_gauge.htm&type=5). Without something like this if you want to use dynamic gauges you need to either base them on a number that already exists on some target record (such as a Campaign with a Revenue Goal field) or you have to make a workaround, such as dummy records with a number field that you will use for the gauge target.

With a DashboardTarget object you have an convenient place to create records for any gauges you will want to create. The object here is built to allow for either manually created and maintained records or records that are automatically updated. An example of a manual record could be "2023 fundraising target." This is a number that staff arrive at through discussion and is not directly generated from data. Using a manual DashboardTarget you can put in the number and use it on a dashboard. An auto-updated example would be something like "Enrolled Students." Since students could come and go, you want this record to update itself if/when there are 

There is a flow that can read DashboardTarget records for the Contact object and the SOQL on them and then use that SOQL to update the record. There is another flow that can be modified to run as a daily scheduled flow that calls the flow for contact dashboardtargets. To use with targets about other objects simply replicate the DashboardTargets_Contact targets flow to get records of another object and then add calling that as a subflow within DashboardTargets_Run object updates.

There is a dependency on UnofficialSF's flow component for using SQOL (https://unofficialsf.com/a-graphical-soql-query-builder-for-flow/) which gets automatically installed in scratch orgs.

Repo also has a mapping and sample dataset that will insert accounts, contacts, and dashboardtargets. All but one of those dashboardtargets have no value in Target but will be filled if you run the flow.

The dev.json includes the setting for turning off persistent browser caching (enableS1EncryptedStoragePref2).

## Development

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.

## Use

If you want to use this project in real life I **strongly** recommend you deploy it to a sandbox first, test, and then deploy from the sandbox to production. I hope to create an unmanaged package at some point once I learn how to do that. So for now: Steps to deploy to a sandbox:

1. Connect your sandbox to SFDX
    1. a. sfdx force:auth:web:login --setalias __aliasforsandbox__ --instanceurl https://test.salesforce.com 
    2. (once taken to test.salesforce.com you can click to use a custom domain)
2. Make sure that you [install the UnofficialSF flow component](https://unofficialsf.com/a-graphical-soql-query-builder-for-flow/) in your sandbox, since it's required for one of this project's flows. 
3. Delete from your local copy of the project's force-app folder all the parts of it that you do not want to deploy (and are going to cause you errors if you try.) This means:
    1. Folder: dashboards (because the running user won't exist)
    2. Folder: reports (irrelevant)
    3. Folder: applications (I assume you don't want or need to modify the standard Sales app in your sandbox)
    4. Folders for Account and Contact within the objects folder. (All that's there are list views and you shouldn't need them.)
    5. folder: profiles (you wouldn't be able to deploy the admin profile without heavy editing anyway)
4. Deploy the metadata:
    1. sfdx force:source:deploy -u __aliasforsandbox__ -p 'force-app'
5. Once deployed you will need to modify field level security for all of the deployed fields, plus CRUD and tab visibility for DashboardTarget (or nobody will be able to see them--even you!)
6. Don't forget to modify and/or activate the flows that are installed.
