class NameValidator < ActiveModel::Validator
    def validate(record)
      if record.first_name == "Evil"
        record.errors.add :base, "This person is evil"
      end
    end
  end