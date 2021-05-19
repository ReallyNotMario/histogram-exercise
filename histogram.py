import pandas as pd
from pathlib import Path
datasource = Path("./", "nulladdresses.csv")
data = pd.read_csv(datasource)
#from csv to dictionary. Note we only need one colum, namely "contract_ticker_symbol"
rawlist = data[["contract_ticker_symbol"]].to_dict("list").get("contract_ticker_symbol")
#count occurrences of each ticker symbol in list
cookedlist = {i:rawlist.count(i) for i in rawlist}
#transform count to dataframe
df = pd.DataFrame({"Null Addresses":list(cookedlist.values())}, index=list(cookedlist.keys()))
#plot dataframe
graph = df.plot(kind="bar", title="Number of Null Address Fields per Currency", rot = 45)
#save the plot
graph.get_figure().savefig('graph.pdf')
