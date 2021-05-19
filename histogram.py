import pandas as pd
from pathlib import Path
datasource = Path("./", "data.xls")
data = pd.read_excel(datasource)
graph = data.plot(kind="bar", stacked=True, title="Number of Null Address Fields per Currency")
graph.set_xticklabels(data['Crypto'], rotation = 0)
graph.get_figure().savefig('graph.pdf')
