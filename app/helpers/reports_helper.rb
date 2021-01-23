module ReportsHelper
    def stat_by(start_date, end_date)
        start_date ||= 1.month.ago
        end_date ||= Time.current
    end

    private

    def basic_opts(title, start_date, end_date)
    {
        discrete: true,
        library: {
        title: {text: title, x: -20},
        subtitle: {text: "from #{l(start_date, format: :medium)} to #{l(end_date, format: :medium)}", x: -20},
        yAxis: {
            title: {
            text: 'Amount'
            }
        },
        tooltip: {
            valueSuffix: 'Expenses'
        },
        credits: {
            enabled: false
        }
        }
    }
    end
end
