# DynamicGaugeTargets

This repo demonstrates creating an object (DashboardTarget) for storing target numbers for [dashboard Dynamic Gauge components](https://help.salesforce.com/s/articleView?id=sf.dashboards_lex_chart_gauge.htm&type=5). Without something like this if you want to use dynamic gauges you need to either base them on a number that already exists on some target record (such as a Campaign with a Revenue Goal field) or you have to make a workaround, such as dummy records with a number field that you will use for the gauge target.

With a DashboardTarget object you have an convenient place to create records for any gauges you will want to create. The object here is built to allow for either manually created and maintained records or records that are automatically updated. 

An example of a manual record could be "2023 fundraising target." This is a number that staff arrive at through discussion and is not directly generated from data. Using a manual DashboardTarget you can put in the number and use it on a dashboard. If the goal is changed later due to further discussions all you have to do is change the one record and any dashboards based it on will immediately keep pace!

An auto-updated example would be something like "Enrolled Students." Since students could come and go, you want this record to update itself if/when there are any changes. Then any dashboard gauges based on this number (example: "% of enrolled students with a GPA above 3.5") would automatically readjust the top target when students leave the program.

Included in this repo are three flows:
1. DashboardTarget_BeforeSave_Update_SOQL_Query - This is a before save record-triggered flow. Because we wanted to have the ability to have a longer SOQL WHERE clause field than 255 characters, this flow works as though the SOQL Query field were a formula. Whenever a DashboardTarget record's SObject or SOQL WHERE clause fields are updated it updates the SOQL Query field to keep it up to date.
2. DashboardTargets_Contact_targets - This is an autolaunched flow that gathers all auto-updated records that use the Contact object and runs their SOQL Query to fill their target. This is meant to be launched by some kind of scheduled automation. If you have DashboardTarget records that look at other objects than Contact you will want to copy this flow for each object.
3. DashboardTarget_Run_object_updates - This flow is a template for what you would use to put in place automation to regularly refresh your automatic targets. It's built as an auto-launched flow but is really meant to be saved as a new Schedule Triggered Flow and set to run once per day, for example. I put a pause element of zero days before the flow calls DashboardTargets_Contact_targets. If you do this for each object-based subflow you need to use you will ensure that SOQL query limits are reset between each subflow. (Not that I expect most users will have so many DashboardTarget records that it will be a problem.) 


There is a dependency on UnofficialSF's flow component for using SQOL (https://unofficialsf.com/a-graphical-soql-query-builder-for-flow/) which gets automatically installed in scratch orgs. If you want to use this project in a sandbox or in production you will need to install that component first.

The repository also has a mapping and sample dataset that will insert accounts, contacts, and dashboardtargets. All but one of those dashboardtargets have no value in Target but will be filled if you run the DashboardTargets_Contact_targets flow.

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
