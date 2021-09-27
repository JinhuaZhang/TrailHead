trigger ClosedOppertunityTrigger on Opportunity (after insert, after update) {

    List<Opportunity> opportunities = [SELECT Id FROM Opportunity WHERE Id IN :Trigger.new AND StageName = 'Closed Win'];
    List<Task> tasks = new List<Task>();

    for(Opportunity opportunity : opportunities) {
        tasks.add(new Task(Subject = 'Follow Up Test Task', WhatId = opportunity.Id));
    }

    if(tasks.size() > 0){
        insert tasks;
    }   
}