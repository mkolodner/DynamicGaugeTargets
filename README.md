# DynamicGaugeTargets

**Go to the [project wiki](https://github.com/mkolodner/DynamicGaugeTargets/wiki) for install instructions, all documentation and user-focused content.**

This repo demonstrates creating an object (DashboardTarget) for storing target numbers for [dashboard Dynamic Gauge components](https://help.salesforce.com/s/articleView?id=sf.dashboards_lex_chart_gauge.htm&type=5).  Here within the repo (and this ReadMe) you will only find information about using the actual repo's code.


There is a dependency on UnofficialSF's flow component for using SQOL (https://unofficialsf.com/a-graphical-soql-query-builder-for-flow/) which gets automatically installed in scratch orgs.

The repository has a mapping and sample dataset that will insert accounts, contacts, and dashboardtargets. All but one of those dashboardtargets have no value in Target but will be filled if you run the DashboardTargets_Contact_targets flow.

The dev.json includes the setting for turning off persistent browser caching (enableS1EncryptedStoragePref2).

## Development

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.

## Acknowledgments

The idea for developing this project was sparked by my work with [the Academy Group](https://theacademygroup.com).
