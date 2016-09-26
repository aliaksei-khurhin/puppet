Facter.add(:java_heap) do
  setcode do
    mem = Facter.value(:memorysize_mb)
    result = case mem
      when 0..1366 then '512m'
      when 1367..3071 then '1g'
      else '2g'
    end
    result
  end
end