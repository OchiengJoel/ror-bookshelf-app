class Book < ApplicationRecord

    enum reading_status:{New: 0, Current_Reading: 1, Completed: 2 }
end
