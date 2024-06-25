package com.example.cinema.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ResourceDTO {
    private Integer id;
    @NotBlank(message = "资源名不能为空")
    private String resourceName;
    @NotBlank(message = "url不能为空")
    private String url;
    @NotBlank(message = "请求方式不能为空")
    private String requestMethod;
    private Integer parentId;
    private Integer isAnonymous;
}
