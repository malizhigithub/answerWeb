package cn.edu.lingnan.pojo;

import java.util.ArrayList;
import java.util.List;

public class RecordsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public RecordsExample() {
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

        public Criteria andRecordsnoIsNull() {
            addCriterion("recordsno is null");
            return (Criteria) this;
        }

        public Criteria andRecordsnoIsNotNull() {
            addCriterion("recordsno is not null");
            return (Criteria) this;
        }

        public Criteria andRecordsnoEqualTo(Integer value) {
            addCriterion("recordsno =", value, "recordsno");
            return (Criteria) this;
        }

        public Criteria andRecordsnoNotEqualTo(Integer value) {
            addCriterion("recordsno <>", value, "recordsno");
            return (Criteria) this;
        }

        public Criteria andRecordsnoGreaterThan(Integer value) {
            addCriterion("recordsno >", value, "recordsno");
            return (Criteria) this;
        }

        public Criteria andRecordsnoGreaterThanOrEqualTo(Integer value) {
            addCriterion("recordsno >=", value, "recordsno");
            return (Criteria) this;
        }

        public Criteria andRecordsnoLessThan(Integer value) {
            addCriterion("recordsno <", value, "recordsno");
            return (Criteria) this;
        }

        public Criteria andRecordsnoLessThanOrEqualTo(Integer value) {
            addCriterion("recordsno <=", value, "recordsno");
            return (Criteria) this;
        }

        public Criteria andRecordsnoIn(List<Integer> values) {
            addCriterion("recordsno in", values, "recordsno");
            return (Criteria) this;
        }

        public Criteria andRecordsnoNotIn(List<Integer> values) {
            addCriterion("recordsno not in", values, "recordsno");
            return (Criteria) this;
        }

        public Criteria andRecordsnoBetween(Integer value1, Integer value2) {
            addCriterion("recordsno between", value1, value2, "recordsno");
            return (Criteria) this;
        }

        public Criteria andRecordsnoNotBetween(Integer value1, Integer value2) {
            addCriterion("recordsno not between", value1, value2, "recordsno");
            return (Criteria) this;
        }

        public Criteria andUsernoIsNull() {
            addCriterion("userno is null");
            return (Criteria) this;
        }

        public Criteria andUsernoIsNotNull() {
            addCriterion("userno is not null");
            return (Criteria) this;
        }

        public Criteria andUsernoEqualTo(Integer value) {
            addCriterion("userno =", value, "userno");
            return (Criteria) this;
        }

        public Criteria andUsernoNotEqualTo(Integer value) {
            addCriterion("userno <>", value, "userno");
            return (Criteria) this;
        }

        public Criteria andUsernoGreaterThan(Integer value) {
            addCriterion("userno >", value, "userno");
            return (Criteria) this;
        }

        public Criteria andUsernoGreaterThanOrEqualTo(Integer value) {
            addCriterion("userno >=", value, "userno");
            return (Criteria) this;
        }

        public Criteria andUsernoLessThan(Integer value) {
            addCriterion("userno <", value, "userno");
            return (Criteria) this;
        }

        public Criteria andUsernoLessThanOrEqualTo(Integer value) {
            addCriterion("userno <=", value, "userno");
            return (Criteria) this;
        }

        public Criteria andUsernoIn(List<Integer> values) {
            addCriterion("userno in", values, "userno");
            return (Criteria) this;
        }

        public Criteria andUsernoNotIn(List<Integer> values) {
            addCriterion("userno not in", values, "userno");
            return (Criteria) this;
        }

        public Criteria andUsernoBetween(Integer value1, Integer value2) {
            addCriterion("userno between", value1, value2, "userno");
            return (Criteria) this;
        }

        public Criteria andUsernoNotBetween(Integer value1, Integer value2) {
            addCriterion("userno not between", value1, value2, "userno");
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

        public Criteria andAcnumberIsNull() {
            addCriterion("acnumber is null");
            return (Criteria) this;
        }

        public Criteria andAcnumberIsNotNull() {
            addCriterion("acnumber is not null");
            return (Criteria) this;
        }

        public Criteria andAcnumberEqualTo(Integer value) {
            addCriterion("acnumber =", value, "acnumber");
            return (Criteria) this;
        }

        public Criteria andAcnumberNotEqualTo(Integer value) {
            addCriterion("acnumber <>", value, "acnumber");
            return (Criteria) this;
        }

        public Criteria andAcnumberGreaterThan(Integer value) {
            addCriterion("acnumber >", value, "acnumber");
            return (Criteria) this;
        }

        public Criteria andAcnumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("acnumber >=", value, "acnumber");
            return (Criteria) this;
        }

        public Criteria andAcnumberLessThan(Integer value) {
            addCriterion("acnumber <", value, "acnumber");
            return (Criteria) this;
        }

        public Criteria andAcnumberLessThanOrEqualTo(Integer value) {
            addCriterion("acnumber <=", value, "acnumber");
            return (Criteria) this;
        }

        public Criteria andAcnumberIn(List<Integer> values) {
            addCriterion("acnumber in", values, "acnumber");
            return (Criteria) this;
        }

        public Criteria andAcnumberNotIn(List<Integer> values) {
            addCriterion("acnumber not in", values, "acnumber");
            return (Criteria) this;
        }

        public Criteria andAcnumberBetween(Integer value1, Integer value2) {
            addCriterion("acnumber between", value1, value2, "acnumber");
            return (Criteria) this;
        }

        public Criteria andAcnumberNotBetween(Integer value1, Integer value2) {
            addCriterion("acnumber not between", value1, value2, "acnumber");
            return (Criteria) this;
        }

        public Criteria andErunmberIsNull() {
            addCriterion("erunmber is null");
            return (Criteria) this;
        }

        public Criteria andErunmberIsNotNull() {
            addCriterion("erunmber is not null");
            return (Criteria) this;
        }

        public Criteria andErunmberEqualTo(Integer value) {
            addCriterion("erunmber =", value, "erunmber");
            return (Criteria) this;
        }

        public Criteria andErunmberNotEqualTo(Integer value) {
            addCriterion("erunmber <>", value, "erunmber");
            return (Criteria) this;
        }

        public Criteria andErunmberGreaterThan(Integer value) {
            addCriterion("erunmber >", value, "erunmber");
            return (Criteria) this;
        }

        public Criteria andErunmberGreaterThanOrEqualTo(Integer value) {
            addCriterion("erunmber >=", value, "erunmber");
            return (Criteria) this;
        }

        public Criteria andErunmberLessThan(Integer value) {
            addCriterion("erunmber <", value, "erunmber");
            return (Criteria) this;
        }

        public Criteria andErunmberLessThanOrEqualTo(Integer value) {
            addCriterion("erunmber <=", value, "erunmber");
            return (Criteria) this;
        }

        public Criteria andErunmberIn(List<Integer> values) {
            addCriterion("erunmber in", values, "erunmber");
            return (Criteria) this;
        }

        public Criteria andErunmberNotIn(List<Integer> values) {
            addCriterion("erunmber not in", values, "erunmber");
            return (Criteria) this;
        }

        public Criteria andErunmberBetween(Integer value1, Integer value2) {
            addCriterion("erunmber between", value1, value2, "erunmber");
            return (Criteria) this;
        }

        public Criteria andErunmberNotBetween(Integer value1, Integer value2) {
            addCriterion("erunmber not between", value1, value2, "erunmber");
            return (Criteria) this;
        }

        public Criteria andWechatusernoIsNull() {
            addCriterion("wechatuserno is null");
            return (Criteria) this;
        }

        public Criteria andWechatusernoIsNotNull() {
            addCriterion("wechatuserno is not null");
            return (Criteria) this;
        }

        public Criteria andWechatusernoEqualTo(Integer value) {
            addCriterion("wechatuserno =", value, "wechatuserno");
            return (Criteria) this;
        }

        public Criteria andWechatusernoNotEqualTo(Integer value) {
            addCriterion("wechatuserno <>", value, "wechatuserno");
            return (Criteria) this;
        }

        public Criteria andWechatusernoGreaterThan(Integer value) {
            addCriterion("wechatuserno >", value, "wechatuserno");
            return (Criteria) this;
        }

        public Criteria andWechatusernoGreaterThanOrEqualTo(Integer value) {
            addCriterion("wechatuserno >=", value, "wechatuserno");
            return (Criteria) this;
        }

        public Criteria andWechatusernoLessThan(Integer value) {
            addCriterion("wechatuserno <", value, "wechatuserno");
            return (Criteria) this;
        }

        public Criteria andWechatusernoLessThanOrEqualTo(Integer value) {
            addCriterion("wechatuserno <=", value, "wechatuserno");
            return (Criteria) this;
        }

        public Criteria andWechatusernoIn(List<Integer> values) {
            addCriterion("wechatuserno in", values, "wechatuserno");
            return (Criteria) this;
        }

        public Criteria andWechatusernoNotIn(List<Integer> values) {
            addCriterion("wechatuserno not in", values, "wechatuserno");
            return (Criteria) this;
        }

        public Criteria andWechatusernoBetween(Integer value1, Integer value2) {
            addCriterion("wechatuserno between", value1, value2, "wechatuserno");
            return (Criteria) this;
        }

        public Criteria andWechatusernoNotBetween(Integer value1, Integer value2) {
            addCriterion("wechatuserno not between", value1, value2, "wechatuserno");
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