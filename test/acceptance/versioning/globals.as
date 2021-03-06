/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import avmplus.*;
import avmshell.*;
import com.adobe.test.Assert;

// var SECTION = 'API Versioning - globals';
// var VERSION = 'AS3';



var re:String;
var re1065:String = 'ReferenceError: Error #1065';
var re1056:String = 'ReferenceError: Error #1056';

var apiVersion:int = System.apiVersion;

// expected answers
var apiExpectedAns:Array = [];
re = re1065;
apiExpectedAns[API_AIR_1_0]         = [true, true, true,   re,   re,   re,   re,   re,   re, true, true,   re, true];
apiExpectedAns[API_FP_10_0]         = [true, true,   re, true,   re,   re,   re,   re,   re, true, true, true, true];
apiExpectedAns[API_AIR_1_5]         = [true, true, true, true, true,   re,   re,   re,   re, true, true, true, true];
apiExpectedAns[API_AIR_1_5_1]       = [true, true, true, true, true, true,   re,   re,   re, true, true, true, true];
apiExpectedAns[API_FP_10_0_32]      = [true, true,   re, true,   re,   re, true,   re,   re, true, true, true, true];
apiExpectedAns[API_AIR_1_5_2]       = [true, true, true, true, true, true, true, true,   re, true, true, true, true];

// expected answer for set
var apiExpectedSetAns:Array =[];
re = re1056; // missing set generates a 1056 ref error
apiExpectedSetAns[API_AIR_1_0]      = [true, true, true,   re,   re,   re,   re,   re,   re, true, true,   re, true];
apiExpectedSetAns[API_FP_10_0]      = [true, true,   re, true,   re,   re,   re,   re,   re, true, true, true, true];
apiExpectedSetAns[API_AIR_1_5]      = [true, true, true, true, true,   re,   re,   re,   re, true, true, true, true];
apiExpectedSetAns[API_AIR_1_5_1]    = [true, true, true, true, true, true,   re,   re,   re, true, true, true, true];
apiExpectedSetAns[API_FP_10_0_32]   = [true, true,   re, true,   re,   re, true,   re,   re, true, true, true, true];
apiExpectedSetAns[API_AIR_1_5_2]    = [true, true, true, true, true, true, true, true,   re, true, true, true, true];

// set expected answers to specified api version
var ea:Array = apiExpectedAns[apiVersion]
var ea_set:Array = apiExpectedSetAns[apiVersion]

if (ea == null)
{
   Assert.expectEq("unknown apiVersion", 0, apiVersion);
}
else
{
    versionTest(function() { return public_var }, 'public_var', ea[0]);
    versionTest(function() { return public_var_AIR_1_0 }, 'public_var_AIR_1_0', ea[2]);
    versionTest(function() { return public_var_FP_10_0 }, 'public_var_FP_10_0', ea[3]);
    versionTest(function() { return public_var_AIR_1_5 }, 'public_var_AIR_1_5', ea[4]);
    versionTest(function() { return public_var_AIR_1_5_1 }, 'public_var_AIR_1_5_1', ea[5]);
    versionTest(function() { return public_var_FP_10_0_32 }, 'public_var_FP_10_0_32', ea[6]);
    versionTest(function() { return public_var_AIR_1_5_2 }, 'public_var_AIR_1_5_2', ea[7]);
    versionTest(function() { return public_var_AIR_1_0_FP_10_0 }, 'public_var_AIR_1_0_FP_10_0', ea[9]);
    versionTest(function() { return public_var_AIR_1_5_1_FP_10_0_AIR_1_5_2 }, 'public_var_AIR_1_5_1_FP_10_0_AIR_1_5_2', ea[11]);
    versionTest(function() { return public_var_FP_10_0_32_AIR_1_0_FP_10_0 }, 'public_var_FP_10_0_32_AIR_1_0_FP_10_0', ea[12]);

    versionTest(function() { return public_const }, 'public_const', ea[0]);
    versionTest(function() { return public_const_AIR_1_0 }, 'public_const_AIR_1_0', ea[2]);
    versionTest(function() { return public_const_FP_10_0 }, 'public_const_FP_10_0', ea[3]);
    versionTest(function() { return public_const_AIR_1_5 }, 'public_const_AIR_1_5', ea[4]);
    versionTest(function() { return public_const_AIR_1_5_1 }, 'public_const_AIR_1_5_1', ea[5]);
    versionTest(function() { return public_const_FP_10_0_32 }, 'public_const_FP_10_0_32', ea[6]);
    versionTest(function() { return public_const_AIR_1_5_2 }, 'public_const_AIR_1_5_2', ea[7]);
    versionTest(function() { return public_const_AIR_1_0_FP_10_0 }, 'public_const_AIR_1_0_FP_10_0', ea[9]);
    versionTest(function() { return public_const_AIR_1_5_1_FP_10_0_AIR_1_5_2 }, 'public_const_AIR_1_5_1_FP_10_0_AIR_1_5_2', ea[11]);
    versionTest(function() { return public_const_FP_10_0_32_AIR_1_0_FP_10_0 }, 'public_const_FP_10_0_32_AIR_1_0_FP_10_0', ea[12]);

    versionTest(function() { return public_function()}, 'public_function', ea[0]);
    versionTest(function() { return public_function_AIR_1_0()}, 'public_function_AIR_1_0', ea[2]);
    versionTest(function() { return public_function_FP_10_0()}, 'public_function_FP_10_0', ea[3]);
    versionTest(function() { return public_function_AIR_1_5()}, 'public_function_AIR_1_5', ea[4]);
    versionTest(function() { return public_function_AIR_1_5_1()}, 'public_function_AIR_1_5_1', ea[5]);
    versionTest(function() { return public_function_FP_10_0_32()}, 'public_function_FP_10_0_32', ea[6]);
    versionTest(function() { return public_function_AIR_1_5_2()}, 'public_function_AIR_1_5_2', ea[7]);
    versionTest(function() { return public_function_AIR_1_0_FP_10_0()}, 'public_function_AIR_1_0_FP_10_0', ea[9]);
    versionTest(function() { return public_function_AIR_1_5_1_FP_10_0_AIR_1_5_2()}, 'public_function_AIR_1_5_1_FP_10_0_AIR_1_5_2', ea[11]);
    versionTest(function() { return public_function_FP_10_0_32_AIR_1_0_FP_10_0()}, 'public_function_FP_10_0_32_AIR_1_0_FP_10_0', ea[12]);

    versionTest(function() { return public_getset }, 'public_getset', ea[0]);
    versionTest(function() { return public_getset_AIR_1_0 }, 'public_getset_AIR_1_0', ea[2]);
    versionTest(function() { return public_getset_FP_10_0 }, 'public_getset_FP_10_0', ea[3]);
    versionTest(function() { return public_getset_AIR_1_5 }, 'public_getset_AIR_1_5', ea[4]);
    versionTest(function() { return public_getset_AIR_1_5_1 }, 'public_getset_AIR_1_5_1', ea[5]);
    versionTest(function() { return public_getset_FP_10_0_32 }, 'public_getset_FP_10_0_32', ea[6]);
    versionTest(function() { return public_getset_AIR_1_5_2 }, 'public_getset_AIR_1_5_2', ea[7]);
    versionTest(function() { return public_getset_AIR_1_0_FP_10_0 }, 'public_getset_AIR_1_0_FP_10_0', ea[9]);
    versionTest(function() { return public_getset_AIR_1_5_1_FP_10_0_AIR_1_5_2 }, 'public_getset_AIR_1_5_1_FP_10_0_AIR_1_5_2', ea[11]);
    versionTest(function() { return public_getset_FP_10_0_32_AIR_1_0_FP_10_0 }, 'public_getset_FP_10_0_32_AIR_1_0_FP_10_0', ea[12]);

    versionTest(function() { avmshell.public_getset = true; return true; }, 'public_getset', ea_set[0]);
    versionTest(function() { avmshell.public_getset_AIR_1_0 = true; return true; }, 'public_getset_AIR_1_0', ea_set[2]);
    versionTest(function() { avmshell.public_getset_FP_10_0 = true; return true; }, 'public_getset_FP_10_0', ea_set[3]);
    versionTest(function() { avmshell.public_getset_AIR_1_5 = true; return true; }, 'public_getset_AIR_1_5', ea_set[4]);
    versionTest(function() { avmshell.public_getset_AIR_1_5_1 = true; return true; }, 'public_getset_AIR_1_5_1', ea_set[5]);
    versionTest(function() { avmshell.public_getset_FP_10_0_32 = true; return true; }, 'public_getset_FP_10_0_32', ea_set[6]);
    versionTest(function() { avmshell.public_getset_AIR_1_5_2 = true; return true; }, 'public_getset_AIR_1_5_2', ea_set[7]);
    versionTest(function() { avmshell.public_getset_AIR_1_0_FP_10_0 = true; return true; }, 'public_getset_AIR_1_0_FP_10_0', ea_set[9]);
    versionTest(function() { avmshell.public_getset_AIR_1_5_1_FP_10_0_AIR_1_5_2 = true; return true; }, 'public_getset_AIR_1_5_1_FP_10_0_AIR_1_5_2', ea_set[11]);
    versionTest(function() { avmshell.public_getset_FP_10_0_32_AIR_1_0_FP_10_0 = true; return true; }, 'public_getset_FP_10_0_32_AIR_1_0_FP_10_0', ea_set[12]);
}

// helper function for api versioning tests
function versionTest(testFunc, desc, expected) {
   var result;
   try {
       result = testFunc();
   } catch (e) {
       // Get the error type and code, but not desc if its a debug build
       result = e.toString().substring(0,e.toString().indexOf(':')+13);
   }
   Assert.expectEq(desc, expected, result);
}
