import pandas as pd
from pathlib import Path
datasource = Path("./", "tempdata.csv")
data = pd.read_csv(datasource)
graph = data.plot(kind="bar", title="Number of Null Address Fields per Currency")
graph.set_xticklabels(data['contract_ticker_symbol'], rotation = 0)
graph.get_figure().savefig('graph.pdf')
