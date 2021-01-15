/* tslint:disable */
/* eslint-disable */
/**
 * OpenAPI Petstore
 * This spec is mainly for testing Petstore server and contains fake endpoints, models. Please do not use this for any other purpose. Special characters: \" \\
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

import { exists, mapValues } from '../runtime';
import {
    ReadOnlyFirst,
    ReadOnlyFirstFromJSON,
    ReadOnlyFirstFromJSONTyped,
    ReadOnlyFirstToJSON,
} from './';

/**
 * 
 * @export
 * @interface ArrayTest
 */
export interface ArrayTest {
    /**
     * 
     * @type {Array<string>}
     * @memberof ArrayTest
     */
    arrayOfString?: Array<string>;
    /**
     * 
     * @type {Array<Array<number>>}
     * @memberof ArrayTest
     */
    arrayArrayOfInteger?: Array<Array<number>>;
    /**
     * 
     * @type {Array<Array<ReadOnlyFirst>>}
     * @memberof ArrayTest
     */
    arrayArrayOfModel?: Array<Array<ReadOnlyFirst>>;
}

export function ArrayTestFromJSON(json: any): ArrayTest {
    return ArrayTestFromJSONTyped(json, false);
}

export function ArrayTestFromJSONTyped(json: any, ignoreDiscriminator: boolean): ArrayTest {
    if ((json === undefined) || (json === null)) {
        return json;
    }
    return {
        
        'arrayOfString': !exists(json, 'array_of_string') ? undefined : json['array_of_string'],
        'arrayArrayOfInteger': !exists(json, 'array_array_of_integer') ? undefined : json['array_array_of_integer'],
        'arrayArrayOfModel': !exists(json, 'array_array_of_model') ? undefined : json['array_array_of_model'],
    };
}

export function ArrayTestToJSON(value?: ArrayTest | null): any {
    if (value === undefined) {
        return undefined;
    }
    if (value === null) {
        return null;
    }
    return {
        
        'array_of_string': value.arrayOfString,
        'array_array_of_integer': value.arrayArrayOfInteger,
        'array_array_of_model': value.arrayArrayOfModel,
    };
}


