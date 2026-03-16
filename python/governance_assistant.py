import psycopg2

DB_CONFIG = {
    "host": "localhost",
    "port": 5432,
    "dbname": "ai_data_governance_platform",
    "user": "postgres",
    "password": "Somesh@2701"
}


def fetch_governance_context(conn):

    cur = conn.cursor()

    cur.execute("""
    SELECT
        d.table_name,
        r.rule_name,
        r.severity,
        rr.status,
        rr.rows_failed
    FROM governance.dataset_registry d
    JOIN governance.rule_catalog r
      ON d.dataset_id = r.dataset_id
    LEFT JOIN governance.rule_runs rr
      ON r.rule_id = rr.rule_id
    """)

    rows = cur.fetchall()
    cur.close()

    context = ""

    for r in rows:
        context += f"""
Dataset: {r[0]}
Rule: {r[1]}
Severity: {r[2]}
Status: {r[3]}
Rows Failed: {r[4]}
"""

    return context


def answer_question(context, question):

    print("\n--- Governance Context ---\n")
    print(context[:1000])

    print("\n--- Question ---\n")
    print(question)

    print("\n--- Simulated AI Answer ---\n")

    if "incident" in question.lower():
        print("Some datasets have active governance incidents. Review rule failures and affected datasets.")

    elif "dataset" in question.lower():
        print("Datasets are monitored through governance rules that validate uniqueness, null values, and referential integrity.")

    elif "rules" in question.lower():
        print("Governance rules enforce data quality constraints like uniqueness, foreign keys, and null checks.")

    else:
        print("Governance system monitors datasets, rules, incidents, and health scores.")


def main():

    conn = psycopg2.connect(**DB_CONFIG)

    context = fetch_governance_context(conn)

    print("\nAI Data Governance Assistant")
    print("---------------------------")

    while True:

        question = input("\nAsk a governance question (type 'exit' to quit): ")

        if question.lower() == "exit":
            break

        answer_question(context, question)

    conn.close()


if __name__ == "__main__":
    main()