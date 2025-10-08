# Model Promotion Policy
# Author: Oualid Choukri

package promotion

import future.keywords.if
import future.keywords.in

# Default deny
default allow = false

# Allow promotion if all conditions met
allow if {
    user_authorized
    metrics_acceptable
    drift_acceptable
}

# Check user role
user_authorized if {
    input.user.roles[_] == "mlops"
}

user_authorized if {
    input.user.roles[_] == "admin"
}

# Check model metrics
metrics_acceptable if {
    input.model.metrics.accuracy >= data.thresholds.min_accuracy
    input.model.metrics.f1_score >= data.thresholds.min_f1_score
    input.model.metrics.roc_auc >= data.thresholds.min_roc_auc
}

# Check drift score
drift_acceptable if {
    input.model.drift_score <= data.thresholds.max_drift_score
}

# Denial reasons for debugging
denial_reasons[reason] {
    not user_authorized
    reason := "User does not have 'mlops' or 'admin' role"
}

denial_reasons[reason] {
    not metrics_acceptable
    reason := "Model metrics do not meet minimum thresholds"
}

denial_reasons[reason] {
    not drift_acceptable
    reason := "Drift score exceeds maximum threshold"
}
