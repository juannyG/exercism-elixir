defmodule Accumulate do
  def accumulate([], fun) do
    []
  end

  def accumulate(list, fun) do
    [fun.(hd(list)) | accumulate(tl(list), fun)]
  end
end
