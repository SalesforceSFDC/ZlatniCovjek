# Override Standard Approval Page in Salesforce1

* https://developer.salesforce.com/forums/?id=906F0000000AbeXIAS
  * override the detail pages approval history related list w/ a vf component or override the entire page w/ vf including a custom approval history related list (to hide the approve/reject link) which I'm working on now.
#
* implementation to hide Approve/Reject link

1. Create visualforce page with relatedList ProcessSteps.
2. jQuery is used to hide the Approve/Reject link on the approval history.
3. Edit Layout -> Remove standard Approval History
4. Edit Layout -> Select visualforce page created in step 1 and drag and drop on to HTML space of Page Layout.

* Go through the below link to see the code. 
http://technicaladda.blogspot.com/2015/07/hide-approvereject-link-on-approval.html
#
Hide Approve/Reject Link On Approval History - Salesforce.com
Hide Approve/Reject Link

1. Create visualforce page (shown below).
2. jQuery is used to hide the Approve/Reject link on the approval history.
3. Edit Layout -> Remove standard Approval History
4. Edit Layout -> Select visualforce page created in step 1 and drag and drop on to HTML space of Page Layout.
