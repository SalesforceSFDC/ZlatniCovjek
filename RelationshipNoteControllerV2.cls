public with class RelationshipNoteControllerV2 {

// @formatter:off
public boolean isDesktop{get;set;}
public boolean isDev{get;set;}
public boolean isQA{get;set;}
public boolean isProd{get;set;}
public boolean isUser{get;set;}

public String recordTypeId{get;set;}
public String userRegion{get;set;}
public String userPrimaryTeam{get;set;}
public String subjectJson{get;set;}
public String pwaProfileId{get;set;}
public String noteId{get;set;}
public String noteHistId{get;set;}
public String userLocale{get;set;}
public String taskType{get;set;}

public Note__c curNote{get;set;}
  
public Task newTask{get;set;}
public List<String> primMeansList{get;set;}
public List<String> subjectList{get;set;}
public List<String> taskStatusList{get;set;}
public List<String> taskPriorList{get;set;}
public String csoEmea{get;set;}
public String csoAsia{get;set;}
public String csoUS{get;set;}
  
public statis Savepoint saveRestore{get;set;}
// @formatter:on
public RelationshipNoteControllerV2() {
  Apexpages.currentPage().getHeaders().put('X-UA-Compatible', 'IE=11');
  noteId = Apexpages.currentPage()

}
