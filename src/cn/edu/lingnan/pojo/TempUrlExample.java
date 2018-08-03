package cn.edu.lingnan.pojo;

import java.util.ArrayList;
import java.util.List;

public class TempUrlExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TempUrlExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andTempurlidIsNull() {
            addCriterion("tempUrlID is null");
            return (Criteria) this;
        }

        public Criteria andTempurlidIsNotNull() {
            addCriterion("tempUrlID is not null");
            return (Criteria) this;
        }

        public Criteria andTempurlidEqualTo(Integer value) {
            addCriterion("tempUrlID =", value, "tempurlid");
            return (Criteria) this;
        }

        public Criteria andTempurlidNotEqualTo(Integer value) {
            addCriterion("tempUrlID <>", value, "tempurlid");
            return (Criteria) this;
        }

        public Criteria andTempurlidGreaterThan(Integer value) {
            addCriterion("tempUrlID >", value, "tempurlid");
            return (Criteria) this;
        }

        public Criteria andTempurlidGreaterThanOrEqualTo(Integer value) {
            addCriterion("tempUrlID >=", value, "tempurlid");
            return (Criteria) this;
        }

        public Criteria andTempurlidLessThan(Integer value) {
            addCriterion("tempUrlID <", value, "tempurlid");
            return (Criteria) this;
        }

        public Criteria andTempurlidLessThanOrEqualTo(Integer value) {
            addCriterion("tempUrlID <=", value, "tempurlid");
            return (Criteria) this;
        }

        public Criteria andTempurlidIn(List<Integer> values) {
            addCriterion("tempUrlID in", values, "tempurlid");
            return (Criteria) this;
        }

        public Criteria andTempurlidNotIn(List<Integer> values) {
            addCriterion("tempUrlID not in", values, "tempurlid");
            return (Criteria) this;
        }

        public Criteria andTempurlidBetween(Integer value1, Integer value2) {
            addCriterion("tempUrlID between", value1, value2, "tempurlid");
            return (Criteria) this;
        }

        public Criteria andTempurlidNotBetween(Integer value1, Integer value2) {
            addCriterion("tempUrlID not between", value1, value2, "tempurlid");
            return (Criteria) this;
        }

        public Criteria andFileurlIsNull() {
            addCriterion("fileUrl is null");
            return (Criteria) this;
        }

        public Criteria andFileurlIsNotNull() {
            addCriterion("fileUrl is not null");
            return (Criteria) this;
        }

        public Criteria andFileurlEqualTo(String value) {
            addCriterion("fileUrl =", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlNotEqualTo(String value) {
            addCriterion("fileUrl <>", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlGreaterThan(String value) {
            addCriterion("fileUrl >", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlGreaterThanOrEqualTo(String value) {
            addCriterion("fileUrl >=", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlLessThan(String value) {
            addCriterion("fileUrl <", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlLessThanOrEqualTo(String value) {
            addCriterion("fileUrl <=", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlLike(String value) {
            addCriterion("fileUrl like", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlNotLike(String value) {
            addCriterion("fileUrl not like", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlIn(List<String> values) {
            addCriterion("fileUrl in", values, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlNotIn(List<String> values) {
            addCriterion("fileUrl not in", values, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlBetween(String value1, String value2) {
            addCriterion("fileUrl between", value1, value2, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlNotBetween(String value1, String value2) {
            addCriterion("fileUrl not between", value1, value2, "fileurl");
            return (Criteria) this;
        }

        public Criteria andNewdateIsNull() {
            addCriterion("newdate is null");
            return (Criteria) this;
        }

        public Criteria andNewdateIsNotNull() {
            addCriterion("newdate is not null");
            return (Criteria) this;
        }

        public Criteria andNewdateEqualTo(String value) {
            addCriterion("newdate =", value, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateNotEqualTo(String value) {
            addCriterion("newdate <>", value, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateGreaterThan(String value) {
            addCriterion("newdate >", value, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateGreaterThanOrEqualTo(String value) {
            addCriterion("newdate >=", value, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateLessThan(String value) {
            addCriterion("newdate <", value, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateLessThanOrEqualTo(String value) {
            addCriterion("newdate <=", value, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateLike(String value) {
            addCriterion("newdate like", value, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateNotLike(String value) {
            addCriterion("newdate not like", value, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateIn(List<String> values) {
            addCriterion("newdate in", values, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateNotIn(List<String> values) {
            addCriterion("newdate not in", values, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateBetween(String value1, String value2) {
            addCriterion("newdate between", value1, value2, "newdate");
            return (Criteria) this;
        }

        public Criteria andNewdateNotBetween(String value1, String value2) {
            addCriterion("newdate not between", value1, value2, "newdate");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}