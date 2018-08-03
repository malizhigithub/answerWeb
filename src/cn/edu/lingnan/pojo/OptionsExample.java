package cn.edu.lingnan.pojo;

import java.util.ArrayList;
import java.util.List;

public class OptionsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OptionsExample() {
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

        public Criteria andOptionsnoIsNull() {
            addCriterion("optionsno is null");
            return (Criteria) this;
        }

        public Criteria andOptionsnoIsNotNull() {
            addCriterion("optionsno is not null");
            return (Criteria) this;
        }

        public Criteria andOptionsnoEqualTo(Integer value) {
            addCriterion("optionsno =", value, "optionsno");
            return (Criteria) this;
        }

        public Criteria andOptionsnoNotEqualTo(Integer value) {
            addCriterion("optionsno <>", value, "optionsno");
            return (Criteria) this;
        }

        public Criteria andOptionsnoGreaterThan(Integer value) {
            addCriterion("optionsno >", value, "optionsno");
            return (Criteria) this;
        }

        public Criteria andOptionsnoGreaterThanOrEqualTo(Integer value) {
            addCriterion("optionsno >=", value, "optionsno");
            return (Criteria) this;
        }

        public Criteria andOptionsnoLessThan(Integer value) {
            addCriterion("optionsno <", value, "optionsno");
            return (Criteria) this;
        }

        public Criteria andOptionsnoLessThanOrEqualTo(Integer value) {
            addCriterion("optionsno <=", value, "optionsno");
            return (Criteria) this;
        }

        public Criteria andOptionsnoIn(List<Integer> values) {
            addCriterion("optionsno in", values, "optionsno");
            return (Criteria) this;
        }

        public Criteria andOptionsnoNotIn(List<Integer> values) {
            addCriterion("optionsno not in", values, "optionsno");
            return (Criteria) this;
        }

        public Criteria andOptionsnoBetween(Integer value1, Integer value2) {
            addCriterion("optionsno between", value1, value2, "optionsno");
            return (Criteria) this;
        }

        public Criteria andOptionsnoNotBetween(Integer value1, Integer value2) {
            addCriterion("optionsno not between", value1, value2, "optionsno");
            return (Criteria) this;
        }

        public Criteria andQuestionnoIsNull() {
            addCriterion("questionno is null");
            return (Criteria) this;
        }

        public Criteria andQuestionnoIsNotNull() {
            addCriterion("questionno is not null");
            return (Criteria) this;
        }

        public Criteria andQuestionnoEqualTo(Integer value) {
            addCriterion("questionno =", value, "questionno");
            return (Criteria) this;
        }

        public Criteria andQuestionnoNotEqualTo(Integer value) {
            addCriterion("questionno <>", value, "questionno");
            return (Criteria) this;
        }

        public Criteria andQuestionnoGreaterThan(Integer value) {
            addCriterion("questionno >", value, "questionno");
            return (Criteria) this;
        }

        public Criteria andQuestionnoGreaterThanOrEqualTo(Integer value) {
            addCriterion("questionno >=", value, "questionno");
            return (Criteria) this;
        }

        public Criteria andQuestionnoLessThan(Integer value) {
            addCriterion("questionno <", value, "questionno");
            return (Criteria) this;
        }

        public Criteria andQuestionnoLessThanOrEqualTo(Integer value) {
            addCriterion("questionno <=", value, "questionno");
            return (Criteria) this;
        }

        public Criteria andQuestionnoIn(List<Integer> values) {
            addCriterion("questionno in", values, "questionno");
            return (Criteria) this;
        }

        public Criteria andQuestionnoNotIn(List<Integer> values) {
            addCriterion("questionno not in", values, "questionno");
            return (Criteria) this;
        }

        public Criteria andQuestionnoBetween(Integer value1, Integer value2) {
            addCriterion("questionno between", value1, value2, "questionno");
            return (Criteria) this;
        }

        public Criteria andQuestionnoNotBetween(Integer value1, Integer value2) {
            addCriterion("questionno not between", value1, value2, "questionno");
            return (Criteria) this;
        }

        public Criteria andContentIsNull() {
            addCriterion("content is null");
            return (Criteria) this;
        }

        public Criteria andContentIsNotNull() {
            addCriterion("content is not null");
            return (Criteria) this;
        }

        public Criteria andContentEqualTo(String value) {
            addCriterion("content =", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotEqualTo(String value) {
            addCriterion("content <>", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentGreaterThan(String value) {
            addCriterion("content >", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentGreaterThanOrEqualTo(String value) {
            addCriterion("content >=", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLessThan(String value) {
            addCriterion("content <", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLessThanOrEqualTo(String value) {
            addCriterion("content <=", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLike(String value) {
            addCriterion("content like", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotLike(String value) {
            addCriterion("content not like", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentIn(List<String> values) {
            addCriterion("content in", values, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotIn(List<String> values) {
            addCriterion("content not in", values, "content");
            return (Criteria) this;
        }

        public Criteria andContentBetween(String value1, String value2) {
            addCriterion("content between", value1, value2, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotBetween(String value1, String value2) {
            addCriterion("content not between", value1, value2, "content");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
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