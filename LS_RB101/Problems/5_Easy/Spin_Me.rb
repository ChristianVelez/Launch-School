test = "abcdefghijkl"

answer = test.split("").map.with_index(1){ |letter, index| index % 3 == 0 ? letter = "*" : letter }

p answer