defmodule Honeybadger.BacktraceTest do
  alias Honeybadger.Backtrace
  use ExUnit.Case

  test "converting a stacktrace to the format Honeybadger expects" do
    stacktrace = [{Honeybadger, :notify, [],
                  [file: 'lib/honeybadger.ex', line: 38]},
                  {Honeybadger.Backtrace, :from_stacktrace, [],
                  [file: 'lib/honeybadger/backtrace.ex', line: 4]}]

    backtrace = Backtrace.from_stacktrace stacktrace

    assert [%{file: "lib/honeybadger.ex", number: 38, method: "notify", app: :honeybadger},
            %{file: "lib/honeybadger/backtrace.ex", number: 4, method: "from_stacktrace", app: :honeybadger}] == backtrace
  end
end
