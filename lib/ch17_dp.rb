# 17.0 Fib seq
# Time: O(n)
def fib_seq(n)
  cache = {}
  fib(n, cache)
end

def fib(n, cache)
  return n if n < 2
  unless cache[n]
    cache[n] = fib(n - 1, cache) + fib(n - 2, cache)
  end
  cache[n]
end
