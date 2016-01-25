#Understanding Spark Caching

## Spark memory caching의 두가지 옵션
### Row caching
- Pretty fast to process
- Can take up 2x-4x more space. (For example, 100MB data cached could consume 350MB memory)
- can put pressure in JVM and JVM garbage collection
- usage :
``` scala
rdd.persist(StorageLevel.MEMORY_ONLY)
//or
rdd.cache()
```

### Serialized Caching
- Slower processing than raw caching
- Overhead is minimal
- less pressure
- usage :
``` scala
rdd.persist(StorageLevel.MEMORY_ONLY_SER)
```

## Conclusion
- raw caching consumes has a bigger footprint in  in memory – about 2x – 4x (e.g. 100MB RDD becomes 370MB)
- Serialized caching consumes almost the same amount of memory as RDD (plus some overhead)
- Raw cache is very fast to process, and it scales pretty well
- Processing serialized cached data takes longer
- 즉 raw caching은 속도가 빠른데 비해 메모리를 많이 사용하고, serialized caching은 메모리를 적게 사용하는 대신해 데이터를 직렬화하는데 시간이 다소 오래 걸린다.


- 참고 : http://sujee.net/2015/01/22/understanding-spark-caching/#.VqXUZlOLTVo
