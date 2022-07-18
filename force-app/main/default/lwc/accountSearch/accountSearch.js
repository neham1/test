/*eslint no-console: ["error", { allow: ["warn", "error"] }] */
import { LightningElement, track, wire, api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import findContacts from '@salesforce/apex/ContactController.getContactList';
import getAccounts from '@salesforce/apex/ContactController.getAccounts';

/** The delay used when debouncing event handlers before invoking Apex. */
const DELAY = 300;
const COLUMNS = [
    { label: 'Name', fieldName: NAME_FIELD.fieldApiName, type: 'text' }
];
export default class AccountSearch extends LightningElement {
    @track searchKey = '';
    @api recordId;
    columns = COLUMNS;
    @wire(getAccounts)
    accounts;
    @wire(findContacts, { searchKey: '$searchKey' })
    contacts;

//connectedCallback function is similar to init method in Lightning Components.
    connectedCallback(){
        this.searchKey = '0012w00000ISZ93AAH';
    }

}