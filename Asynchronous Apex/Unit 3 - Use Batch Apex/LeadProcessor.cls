public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT id, LeadSource FROM Lead');
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> scope) {
        for(Lead ld : scope){
            ld.LeadSource = 'Dreamforce';
        }
        upsert scope;
        recordsProcessed = recordsProcessed + scope.size();
        System.debug('LeadProcessor - In batch job, ' + recordsProcessed + ' records are processed');
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('LeadProcessor - Batch job is finished, ' + recordsProcessed + ' records are processed');
    }
}