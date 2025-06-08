# API Service

| Category     | SLI | SLO                                                                                                         |
|--------------|-----|-------------------------------------------------------------------------------------------------------------|
| Availability |  Total number of successful requests/Total number of requests >= 0.99  | 99%                                                                                                         |
| Latency      |  Percentage of requests with response time <= 100ms   | 90% of requests below 100ms                                                                                 |
| Error Budget |  1-[(1-compliance)/(1-Objective)] | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   |  Total number of successful requests in a second >=5   | 5 RPS indicates the application is functioning                                                              |
