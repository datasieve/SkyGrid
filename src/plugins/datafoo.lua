-- Sample Plugin

require "luasql.postgres";

env = luasql.postgres();

if env == nil then
print("Failed")
else
print("Connected")
end

db = env:connect("dbname=luatest user=postgres password=furbias411 hostaddr=127.0.0.1")

if db == nil then
print("db Failed")
-- os.exit(1)
else
print("db Connected")
end

cur = db:execute("select name from foodata");

if cur == nil then
print("cur Failed")
else
print("cur got something")
end

data = cur:fetch();

while(data ~= nil) do
print(data);
data = cur:fetch();
end


db:close();
