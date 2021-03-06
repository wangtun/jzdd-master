package cn.backend.model.primary.contractarea;

import cn.backend.config.swagger.DataType;
import cn.backend.model.BaseEntity;
import cn.zdwl.common.validgroup.CreateGroup;
import cn.zdwl.common.validgroup.DeleteGroup;
import cn.zdwl.common.validgroup.UpdateGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
/**
 *
 * @author sunkw
 * @date 2019/07/09
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "m_contract_detail_area")
@ApiModel(value = "m_contract_detail_area", description = "计价策略地区")
// @Cacheable
// @Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region = "cn.backend.model.primary.contractarea")
public class ContractareaEntity extends BaseEntity{

    /**
     * 主键
     */
    @Id
    @GeneratedValue(generator = "id")
    @GenericGenerator(name = "id", strategy = "cn.zdwl.common.util.IdGenerator")
    @NotEmpty(message = "主键ID不能为空",groups = {DeleteGroup.class,  UpdateGroup.class})
    @Column(name = "AREA_ID")
    @ApiModelProperty(value = "主键ID", dataType = DataType.STRING)
    private String id;

    /**
     * 公司编号
     */
    @NotEmpty(message = "公司编号不能为空",groups = {CreateGroup.class, UpdateGroup.class})
    @Column(name="CORP_NO")
    @ApiModelProperty(value = "公司编号", dataType = DataType.STRING)
    private String corpNo;

    /**
     * 合同编码
     */
    @NotEmpty(message = "合同编码不能为空",groups = {CreateGroup.class, UpdateGroup.class})
    @Column(name="DETAIL_NO")
    @ApiModelProperty(value = "合同编码", dataType = DataType.STRING)
    private String detailNo;

    /**
     * 省份
     */
    @NotEmpty(message = "省份不能为空",groups = {CreateGroup.class, UpdateGroup.class})
    @Column(name="CONTRACT_PROVINCE")
    @ApiModelProperty(value = "省份", dataType = DataType.STRING)
    private String contractProvince;

    /**
     * 城市
     */
    @NotEmpty(message = "城市不能为空",groups = {CreateGroup.class, UpdateGroup.class})
    @Column(name="CONTRACT_CITY")
    @ApiModelProperty(value = "城市", dataType = DataType.STRING)
    private String contractCity;

    /**
     * 区域
     */
    @NotEmpty(message = "区域不能为空",groups = {CreateGroup.class, UpdateGroup.class})
    @Column(name="CONTRACT_RAGION")
    @ApiModelProperty(value = "区域", dataType = DataType.STRING)
    private String contractRagion;

    /**
     * 备注
     */
    @NotEmpty(message = "备注不能为空",groups = {CreateGroup.class, UpdateGroup.class})
    @Column(name="REMARK")
    @ApiModelProperty(value = "备注", dataType = DataType.STRING)
    private String remark;


}

