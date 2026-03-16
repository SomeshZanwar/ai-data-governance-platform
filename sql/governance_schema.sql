-- Dataset registry
CREATE TABLE IF NOT EXISTS governance.dataset_registry (
    dataset_id SERIAL PRIMARY KEY,
    schema_name TEXT NOT NULL,
    table_name TEXT NOT NULL,
    domain TEXT,
    owner TEXT,
    criticality TEXT,
    refresh_frequency TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Column registry
CREATE TABLE IF NOT EXISTS governance.column_registry (
    column_id SERIAL PRIMARY KEY,
    dataset_id INT REFERENCES governance.dataset_registry(dataset_id),
    column_name TEXT,
    data_type TEXT,
    is_nullable BOOLEAN,
    description TEXT
);

-- Rule catalog
CREATE TABLE IF NOT EXISTS governance.rule_catalog (
    rule_id SERIAL PRIMARY KEY,
    dataset_id INT REFERENCES governance.dataset_registry(dataset_id),
    rule_name TEXT,
    rule_type TEXT,
    rule_sql TEXT,
    severity TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Rule run history
CREATE TABLE IF NOT EXISTS governance.rule_runs (
    run_id SERIAL PRIMARY KEY,
    rule_id INT REFERENCES governance.rule_catalog(rule_id),
    run_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rows_checked INT,
    rows_failed INT,
    status TEXT
);

-- Failed rows log
CREATE TABLE IF NOT EXISTS governance.rule_failures (
    failure_id SERIAL PRIMARY KEY,
    run_id INT REFERENCES governance.rule_runs(run_id),
    failed_value TEXT,
    failure_reason TEXT,
    detected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Incident tracker
CREATE TABLE IF NOT EXISTS governance.incidents (
    incident_id SERIAL PRIMARY KEY,
    rule_id INT REFERENCES governance.rule_catalog(rule_id),
    opened_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    severity TEXT,
    status TEXT,
    resolution_notes TEXT
);

-- Dataset health metrics
CREATE TABLE IF NOT EXISTS governance.dataset_health_scores (
    score_id SERIAL PRIMARY KEY,
    dataset_id INT REFERENCES governance.dataset_registry(dataset_id),
    score_date DATE,
    total_rules INT,
    failed_rules INT,
    health_score NUMERIC
);