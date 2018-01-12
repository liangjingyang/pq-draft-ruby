DRAFT_CONFIG = Rails.application.config_for :draft
RESPONSE_CODES = Rails.application.config_for :response_codes
CACHE_JWT = "CACHE_JWT"
# logger
def LOG_DEBUG(message, *tags)
  Rails.logger.tagged('== DEBUG ==', Time.now, tags) {Rails.logger.debug {message}}
end

def LOG_ERROR(message, *tags)
  Rails.logger.tagged('== ERROR ==', Time.now, tags) {Rails.logger.error {message}}
end