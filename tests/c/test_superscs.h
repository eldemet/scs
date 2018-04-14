/* 
 * File:   test_superscs.h
 * Author: chung
 *
 * Created on May 31, 2017, 5:41 PM
 */

#ifndef TEST_SUPERSCS_H
#define TEST_SUPERSCS_H

#include "unit_test_util.h"

#ifdef __cplusplus
extern "C" {
#endif
    
    bool test_superscs_solve(char** str);
    
    bool test_superscs_with_anderson(char** str);
    
    bool test_superscs_000(char** str);
    
    bool test_superscs_001_fpr(char** str);
    
    bool test_superscs_001_rbroyden(char** str);
    
    bool test_superscs_100_rbroyden(char** str);
    
    bool test_superscs_011_progress(char** str);
    
    bool test_residuals(char** str);   
    
    bool test_rho_x(char** str);
    
    bool test_validation(char** str);
    
    bool test_no_normalization(char** str);

    bool test_warm_start(char** str);
    
    bool test_scale(char** str);
    
    bool test_serialize_YAML(char** str);
    
    bool test_copy_YAML(char** str);
    
    bool test_parse_YAML(char** str);
    
    bool test_parse_YAML_2(char** str);
    
    bool test_parse_YAML_3(char** str);
    
    bool test_SDP_from_YAML(char **str);
    
    bool test_logreg_from_YAML(char **str);
    
    bool test_power_from_YAML(char **str);
    
    bool test_exponential_unbdd_from_YAML(char **str);
    
    bool test_problem_metadata(char **str);

#ifdef __cplusplus
}
#endif

#endif /* TEST_SUPERSCS_H */

