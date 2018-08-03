package cn.edu.lingnan.pojo;

import java.util.ArrayList;
import java.util.List;

public class QuestionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public QuestionExample() {
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

        public Criteria andDescriptionIsNull() {
            addCriterion("description is null");
            return (Criteria) this;
        }

        public Criteria andDescriptionIsNotNull() {
            addCriterion("description is not null");
            return (Criteria) this;
        }

        public Criteria andDescriptionEqualTo(String value) {
            addCriterion("description =", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotEqualTo(String value) {
            addCriterion("description <>", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionGreaterThan(String value) {
            addCriterion("description >", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("description >=", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLessThan(String value) {
            addCriterion("description <", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLessThanOrEqualTo(String value) {
            addCriterion("description <=", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLike(String value) {
            addCriterion("description like", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotLike(String value) {
            addCriterion("description not like", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionIn(List<String> values) {
            addCriterion("description in", values, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotIn(List<String> values) {
            addCriterion("description not in", values, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionBetween(String value1, String value2) {
            addCriterion("description between", value1, value2, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotBetween(String value1, String value2) {
            addCriterion("description not between", value1, value2, "description");
            return (Criteria) this;
        }

        public Criteria andConstatusIsNull() {
            addCriterion("constatus is null");
            return (Criteria) this;
        }

        public Criteria andConstatusIsNotNull() {
            addCriterion("constatus is not null");
            return (Criteria) this;
        }

        public Criteria andConstatusEqualTo(Integer value) {
            addCriterion("constatus =", value, "constatus");
            return (Criteria) this;
        }

        public Criteria andConstatusNotEqualTo(Integer value) {
            addCriterion("constatus <>", value, "constatus");
            return (Criteria) this;
        }

        public Criteria andConstatusGreaterThan(Integer value) {
            addCriterion("constatus >", value, "constatus");
            return (Criteria) this;
        }

        public Criteria andConstatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("constatus >=", value, "constatus");
            return (Criteria) this;
        }

        public Criteria andConstatusLessThan(Integer value) {
            addCriterion("constatus <", value, "constatus");
            return (Criteria) this;
        }

        public Criteria andConstatusLessThanOrEqualTo(Integer value) {
            addCriterion("constatus <=", value, "constatus");
            return (Criteria) this;
        }

        public Criteria andConstatusIn(List<Integer> values) {
            addCriterion("constatus in", values, "constatus");
            return (Criteria) this;
        }

        public Criteria andConstatusNotIn(List<Integer> values) {
            addCriterion("constatus not in", values, "constatus");
            return (Criteria) this;
        }

        public Criteria andConstatusBetween(Integer value1, Integer value2) {
            addCriterion("constatus between", value1, value2, "constatus");
            return (Criteria) this;
        }

        public Criteria andConstatusNotBetween(Integer value1, Integer value2) {
            addCriterion("constatus not between", value1, value2, "constatus");
            return (Criteria) this;
        }

        public Criteria andDesstatusIsNull() {
            addCriterion("desstatus is null");
            return (Criteria) this;
        }

        public Criteria andDesstatusIsNotNull() {
            addCriterion("desstatus is not null");
            return (Criteria) this;
        }

        public Criteria andDesstatusEqualTo(Integer value) {
            addCriterion("desstatus =", value, "desstatus");
            return (Criteria) this;
        }

        public Criteria andDesstatusNotEqualTo(Integer value) {
            addCriterion("desstatus <>", value, "desstatus");
            return (Criteria) this;
        }

        public Criteria andDesstatusGreaterThan(Integer value) {
            addCriterion("desstatus >", value, "desstatus");
            return (Criteria) this;
        }

        public Criteria andDesstatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("desstatus >=", value, "desstatus");
            return (Criteria) this;
        }

        public Criteria andDesstatusLessThan(Integer value) {
            addCriterion("desstatus <", value, "desstatus");
            return (Criteria) this;
        }

        public Criteria andDesstatusLessThanOrEqualTo(Integer value) {
            addCriterion("desstatus <=", value, "desstatus");
            return (Criteria) this;
        }

        public Criteria andDesstatusIn(List<Integer> values) {
            addCriterion("desstatus in", values, "desstatus");
            return (Criteria) this;
        }

        public Criteria andDesstatusNotIn(List<Integer> values) {
            addCriterion("desstatus not in", values, "desstatus");
            return (Criteria) this;
        }

        public Criteria andDesstatusBetween(Integer value1, Integer value2) {
            addCriterion("desstatus between", value1, value2, "desstatus");
            return (Criteria) this;
        }

        public Criteria andDesstatusNotBetween(Integer value1, Integer value2) {
            addCriterion("desstatus not between", value1, value2, "desstatus");
            return (Criteria) this;
        }

        public Criteria andTypenoIsNull() {
            addCriterion("typeno is null");
            return (Criteria) this;
        }

        public Criteria andTypenoIsNotNull() {
            addCriterion("typeno is not null");
            return (Criteria) this;
        }

        public Criteria andTypenoEqualTo(Integer value) {
            addCriterion("typeno =", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoNotEqualTo(Integer value) {
            addCriterion("typeno <>", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoGreaterThan(Integer value) {
            addCriterion("typeno >", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoGreaterThanOrEqualTo(Integer value) {
            addCriterion("typeno >=", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoLessThan(Integer value) {
            addCriterion("typeno <", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoLessThanOrEqualTo(Integer value) {
            addCriterion("typeno <=", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoIn(List<Integer> values) {
            addCriterion("typeno in", values, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoNotIn(List<Integer> values) {
            addCriterion("typeno not in", values, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoBetween(Integer value1, Integer value2) {
            addCriterion("typeno between", value1, value2, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoNotBetween(Integer value1, Integer value2) {
            addCriterion("typeno not between", value1, value2, "typeno");
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